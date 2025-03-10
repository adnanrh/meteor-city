# inject our custom fields into Devise's registrations controller
class DeviseRegistrationsController < Devise::RegistrationsController
  before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  def create
    super do |user|
      user.profile_picture.attach(params[:user][:profile_picture]) if params[:user][:profile_picture].present?
    end
  end

  def update
    super do |user|
      user.profile_picture.attach(params[:user][:profile_picture]) if params[:user][:profile_picture].present?
    end
  end

  private

  def sign_up_params
      params.require(:user).permit(:username, :display_name, :first_name, :last_name, :bio, :profile_picture, :email, :password, :password_confirmation)
  end

  def account_update_params
      params.require(:user).permit(:username, :display_name, :first_name, :last_name, :bio, :profile_picture, :email, :password, :password_confirmation, :current_password)
  end
end
