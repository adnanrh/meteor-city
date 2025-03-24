require_relative "helpers/seeds_helper"
include SeedsHelper

### Create Friendship Requests ###

# Note: Friendship requests are seeded minimally since they depend on mutual visibility logic.
# Recommend testing via UI interactions for realism.
friendship_requests = [
  [killua, leorio],    # Killua requests Leorio
  [kurapika, killua] # Kurapika requests Killua
]

friendship_requests.each do |requester, requested|
  request = FriendshipRequest.find_or_create_by!(requester: requester, requested: requested)
  set_timestamps(request)
end

puts "✅ Seeded friendship requests!"
