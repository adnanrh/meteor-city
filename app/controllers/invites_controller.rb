class InvitesController < ApplicationController
  def show
    # Ensure invite token is provided
    if params[:token].blank?
      redirect_to root_path, alert: "Invalid invite token."
      return
    end

    @invite = Invite.find_by(token: params[:token])

    # Ensure invite exists and is not expired
    if @invite.nil? || @invite.expired?
      redirect_to root_path, alert: "This invite link is invalid or has expired."
      return
    end

    inviter = @invite.inviter

    # Prevent inviter from using their own link
    if current_user == inviter
      redirect_to root_path, alert: "You can't accept your own invite."
      return
    end

    # Check if the user is already friends with the inviter
    if current_user.friends_with?(inviter)
      redirect_to friend_path(inviter), notice: "You're already friends with #{inviter.username}!"
      return
    end
  end

  def create
    current_user.invite&.destroy
    @invite = current_user.create_invite!

    respond_to do |format|
      format.json { render json: { invite_url: view_invite_url(@invite.token) }, status: :created }
      format.html { redirect_to profile_path, notice: "Invite link created!" }
    end
  end
end
