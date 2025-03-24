class FriendshipRequestsController < ApplicationController
    def create
      requested = User.find(params[:requested_id])
      current_user.sent_requests.create!(requested: requested)
      redirect_to preview_path(requested), notice: "Friend request sent!"
    end
  
    def destroy
      request = current_user.sent_requests.find(params[:id])
      request.destroy
      redirect_to friends_path, notice: "Friend request cancelled."
    end
  
    def accept
      request = current_user.received_requests.find(params[:id])
      request.accept!
      redirect_to friends_path, notice: "Friend request accepted!"
    end
  
    def decline
      request = current_user.received_requests.find(params[:id])
      request.destroy!
      redirect_to friends_path, notice: "Friend request declined."
    end

    def index
      @requests = current_user.received_requests.includes(:requester)
    end
  end