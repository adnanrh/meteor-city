class LikesController < ApplicationController
    def create
      post = Post.find(params[:post_id])
      post.likes.find_or_create_by!(user: current_user)
      redirect_to root_path, notice: "Post liked!"
    end
  
    def destroy
      like = current_user.likes.find_by!(post_id: params[:post_id])
      like.destroy
      redirect_to root_path, notice: "Like removed!"
    end
  end
  