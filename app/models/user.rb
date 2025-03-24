class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # --- Friendships ---
  # Because we opt for canonical ordering in the database, we need to specify the
  # class_name and foreign_key for both associations. With canonical ordering, we
  # are ensuring that only 1 row exists for any given pair of friends :), which
  # improves data hygiene, query consistency, and efficient indexing!
  has_many :friends, ->(user) {
    unscope(:where).where(
      "users.id IN (
        SELECT friendships.user1_id FROM friendships WHERE friendships.user2_id = :id
        UNION
        SELECT friendships.user2_id FROM friendships WHERE friendships.user1_id = :id
      )",
    id: user.id
  )
}, class_name: "User"

  # --- Posts & Interactions ---
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # --- Groups ---
  has_many :groups, foreign_key: :creator_id, dependent: :destroy
  has_many :group_memberships, foreign_key: :friend_id, dependent: :destroy
  has_many :member_groups, through: :group_memberships, source: :group

  # --- Invite Management ---
  has_one :invite, foreign_key: :inviter_id, dependent: :destroy

  # --- Friendship Requests ---
  has_many :sent_requests, class_name: "FriendshipRequest", foreign_key: :requester_id, dependent: :destroy
  has_many :received_requests, class_name: "FriendshipRequest", foreign_key: :requested_id, dependent: :destroy

  # --- Active Storage ---
  has_one_attached :profile_picture

  # --- Instance Methods ---

  # Get the user's display name which defaults to first and last name if not set
  def display_name
    read_attribute(:display_name) || "#{first_name} #{last_name}"
  end

  # Create (or replace) the user's invite link
  def generate_invite_link
    invite&.destroy
    create_invite!
    Rails.application.routes.url_helpers.invite_url(invite.token)
  end

  # Check if the user is friends with another user
  def friends_with?(other_user)
    friends.where(id: other_user.id).exists?
  end

  # Find mutual friends with another user
  def mutual_friends_with(other_user)
    my_friend_ids = friends.pluck(:id)
    other_friend_ids = other_user.friends.pluck(:id)
    User.where(id: my_friend_ids & other_friend_ids)
  end

  # Returns only the posts from this user that the given user is allowed to see
  def posts_visible_for_user(viewing_user)
    return Post.none unless friends_with?(viewing_user) || self == viewing_user

    posts.where(
      "visibility = :global OR (visibility = :group_only AND group_id IN (:user_groups))",
      global: Post.visibilities[:global],
      group_only: Post.visibilities[:group_only],
      user_groups: viewing_user.member_groups.pluck(:id)
    )
  end
end
