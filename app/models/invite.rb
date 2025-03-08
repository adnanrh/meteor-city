class Invite < ApplicationRecord
    belongs_to :inviter, class_name: "User"
  
    before_create :generate_token, :set_expiry
  
    validates :token, presence: true, uniqueness: true
    validates :expires_at, presence: true

    # You’d pass this in during acceptance flow
    attr_accessor :accepting_user
  
    def expired?
      expires_at < Time.current
    end
  
    def accept!
      Friendship.create!(user1: inviter, user2: accepting_user)
    end
  
    private
  
    def generate_token
      self.token ||= SecureRandom.urlsafe_base64(16)
    end
  
    def set_expiry
      self.expires_at ||= 7.days.from_now
    end
  end