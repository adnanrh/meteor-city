class FriendshipRequest < ApplicationRecord
    belongs_to :requester, class_name: "User"
    belongs_to :requested, class_name: "User"
  
    validates :requester_id, presence: true
    validates :requested_id, presence: true
    validates :requester_id, uniqueness: { scope: :requested_id }
  
    def accept!
      transaction do
        Friendship.create!(
          user1_id: [requester_id, requested_id].min,
          user2_id: [requester_id, requested_id].max
        )
        destroy!
      end
    end
  
    def decline!
      destroy!
    end
  end