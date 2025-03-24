require_relative "helpers/seeds_helper"
include SeedsHelper

### Configurable Parameters ###
COMMENTS_PER_USER = 2  # Change this to increase/decrease comment activity
LIKES_PER_USER = 3     # Change this to increase/decrease like activity

### Create Comments & Likes ###

# Ensure we have posts
posts = Post.all

# Comments: Each user comments on a set number of random posts (only from friends)
users.each do |user|
  friend_posts = Post.visible_to(user).sample(COMMENTS_PER_USER)

  friend_posts.each do |post|
    comment = Comment.find_or_create_by!(user: user, post: post, content: generate_comment(user))
    set_timestamps(comment)
  end
end

# Likes: Each user likes a set number of random posts (only from friends)
users.each do |user|
  friend_posts = Post.visible_to(user).sample(LIKES_PER_USER)

  friend_posts.each do |post|
    like = Like.find_or_create_by!(user: user, post: post)
    set_timestamps(like)
  end
end

puts "✅ Seeded comments and likes!"
