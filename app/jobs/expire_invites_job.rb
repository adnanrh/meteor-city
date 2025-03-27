class ExpireInvitesJob < ApplicationJob
  queue_as :default

  def perform
    Invite.where("expires_at < ?", Time.current).find_each do |invite|
      invite.destroy
    end
  end
end
