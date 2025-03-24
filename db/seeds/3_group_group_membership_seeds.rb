require_relative "helpers/seeds_helper"
include SeedsHelper

### Create Groups & Add Members ###

# Define groups and their members
group_data = [
  { name: "Squad Zoldyck", creator: killua, members: [gon, kurapika] },
  { name: "Hunters Association", creator: kurapika, members: [leorio, gon] },
  { name: "Nen Training", creator: gon, members: [killua, leorio] },
  { name: "Medical Professionals", creator: leorio, members: [kurapika] },

  # Updated Troupe splits
  { name: "Meteor City Originals", creator: chrollo, members: [
    pakunoda, uvogin, nobunaga, machi, franklin, feitan, phinks, shalnark
  ] },
  { name: "Phantom Newbloods", creator: kalluto, members: [
    shizuku, kortopi, bonolenov, kalluto
  ] },

  # Other groups
  { name: "Greed Island Party", creator: killua, members: [gon, biscuit] },
  { name: "Zoldyck Assassins", creator: illumi, members: [silva, zeno, killua] },
  { name: "Palace of the King", creator: meruem, members: [neferpitou, shaiapouf, youpi] }
]

# Create groups and add members
group_data.each do |data|
  group = Group.find_or_create_by!(name: data[:name], creator: data[:creator])

  # Add members to the group
  data[:members].each do |member|
    unless group.members.include?(member)
      group.members << member
    end
  end

  # Set random timestamps
  set_timestamps(group)
end

puts "✅ Seeded groups and group memberships!"
