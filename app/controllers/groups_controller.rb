class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    def index
      @groups = current_user.groups
    end
  
    def new
      @group = current_user.groups.new
    end

    def show
      # set_group
    end

    def edit
      # set_group
    end
  
    def create
      @group = current_user.groups.new(group_params)
      if @group.save
        # Add selected members to the group
        if params[:group][:friend_ids].present?
          @group.members << User.where(id: params[:group][:friend_ids])
        end
  
        redirect_to group_path(@group), notice: "Group created successfully!"
      else
        render :new
      end
    end
  
    def update
      if @group.update(group_params)
        redirect_to groups_path, notice: "Group updated!"
      else
        render :edit
      end
    end
  
    def destroy
      @group.destroy
      redirect_to groups_path, notice: "Group deleted!"
    end
  
    private

    def set_group
      @group = current_user.groups.find(params[:id]) # Ensure only the creator can access
    end
  
    def group_params
      params.require(:group).permit(:name)
    end
  end
