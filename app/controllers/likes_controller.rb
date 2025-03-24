class LikesController < ApplicationController
    def create
      post = Post.find(params[:post_id])
      like = post.likes.find_by(user: current_user)

      if like
        like.destroy # Unlike if already liked
      else
        post.likes.create!(user: current_user) # Like if not already liked
      end

      redirect_back fallback_location: root_path, notice: "Post liked!"
    end
  
    def destroy
      like = current_user.likes.find_by!(post_id: params[:post_id])
      like.destroy
      redirect_back fallback_location: root_path, notice: "Like removed!"
    end
  end
  