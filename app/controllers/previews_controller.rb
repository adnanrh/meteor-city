class PreviewsController < ApplicationController
    def show
      @user = User.find(params[:id])
  
      unless current_user.mutual_friends_with(@user).exists?
        redirect_to root_path, alert: "Profile preview either not available or user not found."
      end
    end
  end