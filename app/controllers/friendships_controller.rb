class FriendshipsController < ApplicationController
    def create
      invite = Invite.find_by!(token: params[:invite_token])
  
      if invite.expired?
        redirect_to root_path, alert: "This invite link has expired."
        return
      end
  
      if current_user.friends_with?(invite.inviter)
        redirect_to root_path, notice: "You're already friends!"
        return
      end
  
      Friendship.create!(
        user1_id: [current_user.id, invite.inviter.id].min,
        user2_id: [current_user.id, invite.inviter.id].max
      )
  
      invite.record_friendship_created!
  
      redirect_to root_path, notice: "You are now friends with #{invite.inviter.display_name}!"
    end
  end