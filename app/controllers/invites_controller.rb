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
    current_user.create_invite!
    
    render json: { invite_link: invite_url(invite.token) }
  end
end