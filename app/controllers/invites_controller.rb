class InvitesController < ApplicationController
  def show
    @invite = Invite.find_by(token: params[:token])

    if @invite.nil? || @invite.expired?
      redirect_to root_path, alert: "This invite link is invalid or has expired."
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
