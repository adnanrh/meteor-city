class HomeController < ApplicationController
    def index
      # TODO paginate this

      # Get all posts from friends and current user as we want to see our posts on our timeline :)
      post_ids = current_user.friends.pluck(:id) + [current_user.id]
      @posts = Post.where(user_id: post_ids).order(created_at: :desc)
    end
  end
  