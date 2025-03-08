class Post < ApplicationRecord
    belongs_to :user
  
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_one_attached :image
  
    enum post_type: { text: "text", image: "image" }
  
    validates :post_type, presence: true
    validates :content, presence: true, length: { maximum: 500 }, if: -> { text? }
    validate :image_must_be_attached_if_image_post

    before_validation :clear_irrelevant_fields

    before_create :set_default_expiry

    scope :active, -> { where("expires_at IS NULL OR expires_at > ?", Time.current) }

    private

    def image_must_be_attached_if_image_post
      if post_type == "image" && !image.attached?
        errors.add(:image, "must be attached for image posts")
      end
    end

    def set_default_expiry
      self.expires_at ||= 30.days.from_now # Example — tweak this if you want a different default
    end

    def clear_irrelevant_fields
      if post_type == "image"
        self.content = nil  # Remove text content for image posts
      elsif post_type == "text"
        self.image.purge if image.attached?  # Remove image for text posts
        self.caption = nil  # Remove caption for text posts
      end
    end
  end