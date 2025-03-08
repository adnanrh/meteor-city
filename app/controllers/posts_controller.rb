class PostsController < ApplicationController
    def create
      @post = current_user.posts.build(post_params)

      # Attach the image explicitly if present
      @post.image.attach(params[:post][:image]) if params[:post][:image].present?

      if @post.save
        redirect_to root_path, notice: "Post published!"
      else
        redirect_to root_path, alert: "Failed to publish post."
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
      params.require(:post).permit(:post_type, :content, :image, :caption)
    end
  end
  