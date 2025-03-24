require_relative "helpers/seeds_helper"
include SeedsHelper

### Create Invites ###

### Create Invites for All Seeded Users ###
users.each do |user|
  token = "#{user.first_name}_invite"
  invite = Invite.find_or_create_by!(inviter: user, token: token, expires_at: 7.days.from_now)
  set_timestamps(invite)

  puts "📌 Invite for #{user.display_name}: http://localhost:3000/invites/#{token}"
end

puts "✅ Seeded invites for all users!"

