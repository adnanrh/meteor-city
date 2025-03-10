class CommentsController < ApplicationController
    def create
      post = Post.find(params[:post_id])
      post.comments.create!(user: current_user, content: params[:comment][:content])
      redirect_to root_path, notice: "Comment added!"
    end
  
    def destroy
      comment = current_user.comments.find(params[:id])

      if comment
        comment.destroy
        flash[:notice] = "Comment deleted."
      else
        flash[:alert] = "You can only delete your own comments."
      end

      redirect_to root_path, notice: "Comment removed."
    end
  end
