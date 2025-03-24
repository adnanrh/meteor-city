require_relative "helpers/seeds_helper"
include SeedsHelper

password_attributes = { password: "password", password_confirmation: "password" }

### Create Users ###
user_attributes.each do |attributes|
  User.create!(attributes.except(:profile_picture_path).merge(password_attributes)) do |user|
    attach_profile_picture(user, attributes[:profile_picture_path])
  end
end

puts "✅ Seeded users!"
