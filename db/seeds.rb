# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Define helper methods to load local images
def attach_profile_picture(user, filename)
  path = File.expand_path("~/Documents/Meteor\ City/profile_pics/#{filename}")
  if File.exist?(path)
    user.profile_picture.attach(io: File.open(path), filename: filename, content_type: "image/png")
  else
    puts "⚠️ Warning: Profile picture file not found: #{path}"
  end
end

def attach_post_picture(post, filename)
    path = File.expand_path("~/Documents/Meteor\ City/post_pics/#{filename}")
    if File.exist?(path)
      post.image.attach(io: File.open(path), filename: filename, content_type: "image/png")
    else
      puts "⚠️ Warning: Image file not found: #{path}"
    end
  end

### Create Users ###
user1 = User.create!(
  username: "chains95",
  first_name: "Kurapika",
  last_name: "Hunter",
  email: "kurapika@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Just a chill guy who definitely doesn’t hold grudges. Always carrying chains, but it’s a fashion statement. 👁️‍🗨️"
)
attach_profile_picture(user1, "Kurapika.png")

user2 = User.create!(
  username: "gonfreecss",
  first_name: "Gon",
  last_name: "Freecss",
  email: "gon@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Fishing, exploring, and making friends! 🐟 Also, if I ever challenge you to a game, just say no."
)
attach_profile_picture(user2, "Gon.png")

user3 = User.create!(
  username: "leo90",
  first_name: "Leorio",
  last_name: "Paradaknight",
  email: "leorio@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Future doctor. Current debt collector. Buy me a drink, and I might not charge you for a consultation. 🥃"
)
attach_profile_picture(user3, "Leorio.png")

user4 = User.create!(
  username: "kzoldyck",
  first_name: "Killua",
  last_name: "Zoldyck",
  email: "killua@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Ex-assassin, now just a guy trying to enjoy chocolate and electricity-free friendships. ⚡🍫"
)
attach_profile_picture(user4, "Killua.png")

puts "✅ Seeded users!"

# TODO friendships, posts, comments, likes, friendship requests
