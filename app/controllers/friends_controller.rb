class FriendsController < ApplicationController
    def index
      @friends = current_user.friends
    end
  
    def show
      @friend = current_user.friends.find_by(id: params[:id])
  
      unless @friend
        redirect_to root_path, alert: "This user either does not exist or is not your friend."
      end
    end
  end
  