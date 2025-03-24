class Group < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships, source: :friend

  validates :name, presence: true # Group name is required
end