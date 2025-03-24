class FriendsController < ApplicationController
    def index
      @friends = current_user.friends

      # Search functionality
      if params[:query].present?
        query = params[:query].downcase
        @friends = @friends.where("LOWER(username) LIKE ? OR LOWER(display_name) LIKE ?", "%#{query}%", "%#{query}%")
      end
    end
  
    def show
      @friend = current_user.friends.find_by(id: params[:id])
  
      unless @friend
        redirect_to root_path, alert: "This user either does not exist or is not your friend."
      end

      @posts = @friend.posts_visible_for_user(current_user)
                      .order(created_at: :desc)
                      .page(params[:page])
                      .per(10)
      end
  end
  