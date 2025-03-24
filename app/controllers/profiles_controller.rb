class ProfilesController < ApplicationController
    def show
      @user = current_user
      @posts = @user.posts.order(created_at: :desc)
                    .page(params[:page])
                    .per(10)
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(profile_params)
        redirect_to profile_path, notice: "Profile updated!"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def profile_params
      params.require(:user).permit(:name, :bio, :profile_picture)
    end
  end