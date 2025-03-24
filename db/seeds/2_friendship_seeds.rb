require_relative "helpers/seeds_helper"
include SeedsHelper

friendships = [
  # Core 4 — full mesh
  [gon, killua],
  [gon, kurapika],
  [gon, leorio],
  [killua, kurapika],
  [killua, leorio],
  [kurapika, leorio]
]

# Phantom Troupe — full mesh
phantom_troupe = [
  chrollo, feitan, pakunoda, nobunaga, shizuku, franklin, machi,
  phinks, kortopi, bonolenov, uvogin, shalnark, kalluto
]
phantom_troupe.combination(2).each { |a, b| friendships << [a, b] }

# Zoldycks — full mesh
zoldycks = [silva, zeno, illumi, kikyo, milluki, killua, kalluto]
zoldycks.combination(2).each { |a, b| friendships << [a, b] }

# Royal Guard + Meruem — full mesh
royals = [meruem, neferpitou, shaiapouf, youpi]
royals.combination(2).each { |a, b| friendships << [a, b] }

# Logical 1-to-1s for wildcard characters

# Hisoka (flirts with chaos)
friendships << [hisoka, chrollo]
friendships << [hisoka, illumi]
friendships << [hisoka, gon]
friendships << [hisoka, machi]

# Ging (distant but respected)
friendships << [ging, gon]
friendships << [ging, isaac]

# Netero (old hunter guard)
friendships << [isaac, zeno]
friendships << [isaac, ging]
friendships << [isaac, biscuit]

# Bisky (mentor energy)
friendships << [biscuit, gon]
friendships << [biscuit, killua]
friendships << [biscuit, kurapika]

friendships.each do |user_1, user_2|
  friendship = Friendship.find_or_create_by(user1_id: user_1.id, user2_id: user_2.id)
end

puts "✅ Seeded friendships!"
