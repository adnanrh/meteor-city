class PostsController < ApplicationController
    def show
      @post = Post.includes(:likes, comments: :user).find(params[:id])
    end

    def create
      @post = current_user.posts.build(post_params)

      if post_params[:visibility] == "group_only" && post_params[:group_id].blank?
        flash[:alert] = "Please select a group to share your post."
        return render :new
      end

      # Attach the image explicitly if present
      @post.image.attach(post_params[:image]) if post_params[:image].present?

      if @post.save
        redirect_to root_path, notice: "Post published!"
      else
        render :new
      end
    end
  
    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to root_path, notice: "Post deleted."
    end

    def new
      @post = Post.new
    end
  
    private
  
    def post_params
      params.require(:post).permit(:post_type, :content, :image, :caption, :visibility, :group_id)
    end
  end
  