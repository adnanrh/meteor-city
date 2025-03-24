class GroupMembershipsController < ApplicationController
    before_action :set_group
  
    def create
      friend = User.find(params[:friend_id])
  
      if @group.members.include?(friend)
        redirect_to group_path(@group), alert: "#{friend.display_name} is already in the group."
        return
      end
  
      @group.members << friend
      redirect_to group_path(@group), notice: "#{friend.display_name} was added to the group!"
    end
  
    def destroy
      friend = User.find(params[:id])
  
      if @group.members.include?(friend)
        @group.members.destroy(friend)
        redirect_to group_path(@group), notice: "#{friend.display_name} was removed from the group."
      else
        redirect_to group_path(@group), alert: "#{friend.display_name} is not in this group."
      end
    end
  
    private
  
    def set_group
      @group = current_user.groups.find(params[:group_id]) # Only the creator can modify members
    end
  end
