class ExpirePostsJob < ApplicationJob
  queue_as :default

  def perform
    Post.where("expires_at <= ? AND expired = ?", Time.current, false).find_each do |post|
      post.update!(expired: true)
      Rails.logger.info "⏳ Archived post ##{post.id} by @#{post.user.username}"
    end
  end
end
