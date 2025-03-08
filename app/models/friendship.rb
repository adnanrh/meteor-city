class Friendship < ApplicationRecord
    belongs_to :user1, class_name: "User"
    belongs_to :user2, class_name: "User"
  
    before_save :canonical_order
  
    validates :user1_id, presence: true
    validates :user2_id, presence: true
    validates :user1_id, numericality: { less_than: ->(f) { f.user2_id } }, if: -> { f.user1_id && f.user2_id }
  
    private
  
    # consistent sorting of user ids of this friendship, in ascending order
    def canonical_order
      if user1_id > user2_id
        self.user1_id, self.user2_id = user2_id, user1_id
      end
    end
  end