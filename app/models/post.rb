class Post < ApplicationRecord
    belongs_to :user
    belongs_to :group, optional: true
  
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_one_attached :image
  
    enum post_type: { text: "text", image: "image" }
    enum visibility: { global: 0, group_only: 1 }
  
    validates :post_type, presence: true
    validates :content, presence: true, length: { maximum: 500 }, if: -> { text? }
    validate :image_must_be_attached_if_image_post
    validate :group_creator_is_user_if_group_post

    validates :visibility, presence: true
    validates :group_id, presence: true, if: -> { visibility == "group_only" }

    before_validation :clear_irrelevant_fields

    # Default scope: show only active posts (not expired)
    default_scope { where(expired: false) }

    # Scope to get expired (archived) posts
    scope :archived, -> { unscope(where: :expired).where(expired: true) }

    # get all posts that are visible to a given user
    scope :visible_to, ->(user) {
      return none if user.nil? # Edge case handling

      friend_ids = user.friends.pluck(:id) + [user.id]

      # Get global posts (visible to all friends)
      global_posts = where(visibility: :global, user_id: friend_ids)

      # Get groups the user is in (as creator OR member)
      user_group_ids = user.groups.pluck(:id) + GroupMembership.where(friend: user).pluck(:group_id)

      # Get group-specific posts
      group_posts = where(group_id: user_group_ids)

      # Combine both queries
      global_posts.or(group_posts)
    }

    private

    def group_creator_is_user_if_group_post
      unless group_id.nil?
        errors.add(:group, "group creator must match post author") if group.creator_id != user_id
      end
    end

    def image_must_be_attached_if_image_post
      if post_type == "image" && !image.attached?
        errors.add(:image, "must be attached for image posts")
      end
    end

    def clear_irrelevant_fields
      if post_type == "image"
        self.content = nil  # Remove text content for image posts
      elsif post_type == "text"
        self.image.purge if image.attached?  # Remove image for text posts
        self.caption = nil  # Remove caption for text posts
      end
      if visibility == "global"
        self.group_id = nil  # Remove group_id for global posts
      end
    end
  end