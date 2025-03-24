class FriendshipsController < ApplicationController
    # Summary of checks:
    # 1. Ensure the invite token is provided.
    # 2. Ensure the invite token is valid (belongs to an existing invite).
    # 3. Ensure the invite is not expired.
    # 4. Ensure the user is not trying to accept their own invite.
    # 5. Ensure the user is not already friends with the inviter.
    # 6. Create the friendship if all checks pass.
    def create
      # Ensure invite token is provided
      if params[:invite_token].blank?
        redirect_to root_path, alert: "Invalid invite token."
        return
      end

      @invite = Invite.find_by(token: params[:invite_token])

      # Ensure invite exists
      if @invite.nil? || @invite.expired?
        redirect_to root_path, alert: "Invalid or expired invite link."
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
  
      # canonical sorting handled by model
      Friendship.create!(user1: inviter, user2: current_user)
  
      redirect_to friend_path(inviter), notice: "You are now friends with #{inviter.display_name}!"
      return
    end
  end
