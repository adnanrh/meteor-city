module SeedsHelper
  extend self  # Makes all instance methods accessible as module methods, see metaprogramming below

  # List of attributes for seeded users
  def user_attributes
    [ 
      { username: "chains95", first_name: "Kurapika", last_name: "Kurta", email: "kurapika@example.com", bio: "Just a chill guy who definitely doesn’t hold grudges. Always carrying chains, but it’s a fashion statement. 👁️‍🗨️", profile_picture_path: "Kurapika.png"},
      { username: "gonfreecss", first_name: "Gon", last_name: "Freecss", email: "gon@example.com", bio: "Fishing, exploring, and making friends! 🐟 Also, if I ever challenge you to a game, just say no.", profile_picture_path: "Gon.png" },
      { username: "leo90", first_name: "Leorio", last_name: "Paradaknight", email: "leorio@example.com", bio: "Future doctor. Current debt collector. Buy me a drink, and I might not charge you for a consultation. 🥃", profile_picture_path: "Leorio.png" },
      { username: "kzoldyck", first_name: "Killua", last_name: "Zoldyck", email: "killua@example.com", bio: "Ex-assassin, now just a guy trying to enjoy chocolate and electricity-free friendships. ⚡🍫", profile_picture_path: "Killua.png" },
      { username: "chrollobandit", first_name: "Chrollo", last_name: "Lucilfer", email: "chrollo@example.com", bio: "I lead, I read, I bleed aesthetic. 📚🕷️ Don't follow me unless you're ready to disappear.", profile_picture_path: "Chrollo.png" },
      { username: "feitanXX", first_name: "Feitan", last_name: "Portor", email: "feitan@example.com", bio: "Pain is art. Silence is gold. 😶🗡️", profile_picture_path: "Feitan.png" },
      { username: "paku", first_name: "Pakunoda", last_name: "Unknown", email: "pakunoda@example.com", bio: "Memories are weapons. Loyalty is everything. 🧠🐦", profile_picture_path: "Pakunoda.png" },
      { username: "nobunaga94", first_name: "Nobunaga", last_name: "Hazama", email: "nobunaga@example.com", bio: "Samurai spirit, short temper, longer speeches. 🗡️💢", profile_picture_path: "Nobunaga.png" },
      { username: "blinky18", first_name: "Shizuku", last_name: "Murasaki", email: "shizuku@example.com", bio: "I vacuum corpses. I forget names. 🧹🤷‍♀️", profile_picture_path: "Shizuku.png" },
      { username: "franklin11", first_name: "Franklin", last_name: "Bordeaux", email: "franklin@example.com", bio: "Guns in my hands, peace in my heart. 🔫🤖", profile_picture_path: "Franklin.png" },
      { username: "machiko", first_name: "Machi", last_name: "Komacine", email: "machi@example.com", bio: "Threads of fate, and I will cut you. 🧵💔", profile_picture_path: "Machi.png" },
      { username: "phinksmc", first_name: "Phinks", last_name: "Magcub", email: "phinks@example.com", bio: "Dumb muscle, smart fists. 🌀👊", profile_picture_path: "Phinks.png" },
      { username: "kortopi55", first_name: "Kortopi", last_name: "Unknown", email: "kortopi@example.com", bio: "I clone. I fade. I don’t talk much. 🪞🌀", profile_picture_path: "Kortopi.png" },
      { username: "bonndongo", first_name: "Bonolenov", last_name: "Ndongo", email: "bonolenov@example.com", bio: "My body is a battlefield. My tribe is eternal. 🎼⚔️", profile_picture_path: "Bonolenov.png" },
      { username: "bigbang95", first_name: "Uvogin", last_name: "Unknown", email: "uvogin@example.com", bio: "Louder than you. Stronger than you. Hairier than you. 🦁💥", profile_picture_path: "Uvogin.png" },
      { username: "shal", first_name: "Shalnark", last_name: "Unknown", email: "shalnark@example.com", bio: "I’m adorable. I’m dangerous. I’m Bluetooth-enabled. 📱😊", profile_picture_path: "Shalnark.png" },
      { username: "kalluto14", first_name: "Kalluto", last_name: "Zoldyck", email: "kalluto@example.com", bio: "I'm watching. Always. ✂️🎋", profile_picture_path: "Kalluto.png" },
      { username: "silvazoldyck", first_name: "Silva", last_name: "Zoldyck", email: "silva@example.com", bio: "Father of assassins. Lover of silence. 💀🏯", profile_picture_path: "Silva.png" },
      { username: "zenoz", first_name: "Zeno", last_name: "Zoldyck", email: "zeno@example.com", bio: "Old, wise, deadly. And that’s before my morning tea. ☯️🐉", profile_picture_path: "Zeno.png" },
      { username: "illumizoldyck", first_name: "Illumi", last_name: "Zoldyck", email: "illumi@example.com", bio: "Smiling is suspicious. 🪡👁️", profile_picture_path: "Illumi.png" },
      { username: "kikizoldyck", first_name: "Kikyo", last_name: "Zoldyck", email: "kikyo@example.com", bio: "Helicopter mom with real helicopters. 🎭🚁", profile_picture_path: "Kikyo.png" },
      { username: "mill90", first_name: "Milluki", last_name: "Zoldyck", email: "milluki@example.com", bio: "Pro gamer. Hacker. Neckbeard. 🍕💻", profile_picture_path: "Milluki.png" },
      { username: "meruemsama", first_name: "Meruem", last_name: "Chimera", email: "meruem@example.com", bio: "I was born perfect. Then I met a girl who played Gungi. 👑♟️", profile_picture_path: "Meruem.png" },
      { username: "pitou", first_name: "Neferpitou", last_name: "Royal Guard", email: "pitou@example.com", bio: "Puppetmaster. Catgirl. Fan favorite. 🐾🧠", profile_picture_path: "Neferpitou.png" },
      { username: "poufuh", first_name: "Shaiapouf", last_name: "Royal Guard", email: "pouf@example.com", bio: "Too loyal. Too dramatic. Needs therapy. 🎻💫", profile_picture_path: "Shaiapouf.png" },
      { username: "youpi", first_name: "Youpi", last_name: "Royal Guard", email: "youpi@example.com", bio: "I get mad. I get big. Then I cry. 😤💥😢", profile_picture_path: "Youpi.png" },
      { username: "bungeegum", first_name: "Hisoka", last_name: "Morow", email: "hisoka@example.com", bio: "Magician. Murderer. Moist. 🎩🃏💦", profile_picture_path: "Hisoka.png" },
      { username: "bisky51", first_name: "Biscuit", last_name: "Krueger", email: "bisky@example.com", bio: "I’m not cute. I’m terrifying. 💎💪", profile_picture_path: "Bisky.png" },
      { username: "chairmann", first_name: "Isaac", last_name: "Netero", email: "netero@example.com", bio: "Fastest hands in the east. 🙏💥", profile_picture_path: "Netero.png" },
      { username: "gingfreecss", first_name: "Ging", last_name: "Freecss", email: "ging@example.com", bio: "I don’t ghost my son. I just hide *really well*. 🦊🛤️", profile_picture_path: "Ging.png" }
    ]
  end

  # List of seeded usernames
  def usernames
    user_attributes.map { |attrs| attrs[:username] }
  end

  # List of seeded user records
  def users
    userz = usernames.map do |username|
      User.find_by(username: username)
    end
    if userz.size < usernames.size
      puts "⚠️ Warning: Some users are missing! Run the user seeds first."
      exit
    end
    userz.compact
  end

  # Some handy metaprogramming for our seeding :D!! Dynamically define 
  # helper methods for each user. For example, this will generate methods 
  # like "gon", "killua", etc. which will return the corresponding User record.
  user_attributes.each do |attrs|
    define_method(attrs[:first_name].downcase) do
      User.find_by(username: attrs[:username])
    end
  end

  # Generates a dynamic comment based on the user
  def generate_comment(user)
    case user
    when gon
      ["This is awesome! 🏝️", "I wonder what Kite would say about this.", "This reminds me of Whale Island!"].sample
    when killua
      ["Meh, could be cooler. ⚡", "I bet I could do this better. 🛹", "Not bad… for a rookie."].sample
    when kurapika
      ["Vengeance fuels me. 🔴", "I hope the Phantom Troupe doesn’t see this.", "Justice must be served."].sample
    when leorio
      ["Why does this remind me of med school? 😩", "Alright, who’s paying for drinks tonight?", "That’s it, I’m charging consultation fees."].sample
    when chrollo
      ["Fascinating...", "Would love to read more on this.", "Everything is connected."].sample
    when pakunoda
      ["Memories like this stay with you.", "I feel the weight behind this.", "Important, whether you realize it or not."].sample
    when feitan
      ["Boring.", "Need more pain.", "I'll allow this. 🔪"].sample
    when nobunaga
      ["Could’ve been more honorable.", "Nice… but not samurai-level.", "Hm."].sample
    when shizuku
      ["What was I doing again?", "This post is dusty 🧹", "Oh! I like this!"].sample
    when franklin
      ["Solid post.", "This hits hard.", "I respect this."].sample
    when machi
      ["I’ve seen better.", "Not bad.", "Hm. Keep going."].sample
    when phinks
      ["Next time use your fists 💥", "Weak but honest.", "I’m not impressed... yet."].sample
    when shalnark
      ["Cool content! 📱", "I could automate this!", "This gave me ideas."].sample
    when kortopi
      ["...", "One of these is fake.", "Duplicates everywhere lately."].sample
    when bonolenov
      ["A beautiful rhythm in this.", "Resonates deeply.", "War has its own music."].sample
    when uvogin
      ["LOUDER!! 💥", "This post needs more screaming.", "Respect 🤜🤛"].sample
    when kalluto
      ["Interesting thread.", "I’ll be watching closely.", "Quiet... but sharp."].sample
    when silva
      ["Efficient.", "That’ll do.", "Well-executed."].sample
    when zeno
      ["Reminds me of a time long past.", "Quiet power in this.", "I approve. 🐉"].sample
    when illumi
      ["Nice... face.", "This makes me feel... something.", "Looks stable. For now."].sample
    when kikyo
      ["So proud!! 💕", "Reminds me of my darling Killua!", "Family values are *everything*. 💋"].sample
    when milluki
      ["Where’s the Wi-Fi?", "Needs more snack energy.", "I liked it. Now go away."].sample
    when meruem
      ["This holds purpose.", "Unexpected depth.", "I’ll remember this."].sample
    when neferpitou
      ["So exciting! 🐾", "Let me play with this!", "YAY!"].sample
    when shaiapouf
      ["Perfect. Or nearly so.", "His Majesty would approve.", "Hmm. Not symmetrical."].sample
    when youpi
      ["Strange... but nice.", "Feeling things. Weird.", "Okay. I like it."].sample
    when hisoka
      ["Interesting... ❤️", "So *playful*~", "This post is... *arousing* 😏"].sample
    when biscuit
      ["Adorable! But train harder!", "This better not be your best shot.", "Not bad for a rookie."].sample
    when ging
      ["Smart post.", "You’re getting it.", "Good work — now keep going."].sample
    when isaac
      ["Worthy.", "Reminds me of my youth. 🙏", "Well played. Now punch faster."].sample
    else
      ["This is cool!", "Nice one!", "Interesting thought!", "🔥🔥🔥"].sample
    end
  end

  # Define helper methods to load local images and attach them to users
  def attach_profile_picture(user, filename)
    path = Rails.root.join("db/seeds/assets/profile_pics", filename)
    if File.exist?(path)
      user.profile_picture.attach(io: File.open(path), filename: filename, content_type: "image/png")
    else
      puts "⚠️ Warning: Profile picture file not found: #{path}"
    end
  end

  def attach_post_picture(post, filename)
    path = Rails.root.join("db/seeds/assets/post_pics", filename)
  
    if File.exist?(path)
      post.image.attach(io: File.open(path), filename: filename, content_type: "image/png")
    else
      puts "⚠️ Image not found for #{filename}, using fallback."
      fallback_path = Rails.root.join("db/seeds/assets/post_pics", "Fallback.png")
      
      if File.exist?(fallback_path)
        post.image.attach(io: File.open(fallback_path), filename: "Fallback.png", content_type: "image/png")
      else
        puts "❌ Fallback image also missing at: #{fallback_path}"
      end
    end
  end

  # Generate a random timestamp within the last 24 hours
  def random_time_within_last_day
    Time.current - rand(0..86_400) # 86,400 seconds = 24 hours
  end

  # Set created_at and updated_at timestamps on a model instance
  def set_timestamps(record, timestamp = random_time_within_last_day)
    record.assign_attributes(created_at: timestamp, updated_at: timestamp)
    record.save! # Ensures validations & callbacks still run
  end
end
