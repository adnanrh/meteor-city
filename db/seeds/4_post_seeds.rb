require_relative "helpers/seeds_helper"
include SeedsHelper

### Create Posts ###

# Define some post content for each character
posts_data = {
  gon => [
    { post_type: 'text', content: "I want to find my dad! 🏝️"},
    { post_type: 'image', image: 'AdultGon.png', caption: "This is what AI says I'm gonna look like when I'm older!!" }
  ],
  killua => [
    { post_type: 'text', content: "Skateboarding is fun, but assassin life is cooler. 🛹⚡" },
    { post_type: 'image', image: 'WingSan.png', caption: "4 eyes is teaching us Nen..." }
  ],
  kurapika => [
    { post_type: 'text', content: "The eyes of my clan will be avenged. 🔴" },
    { post_type: 'image', image: 'PhantomTroupe.png', caption: "Anyone seen these guys? Asking for a friend ⛓️" }
  ],
  leorio => [
    { post_type: 'text', content: "One day, I’ll be a great doctor! 🩺" },  
    { post_type: 'image', image: 'Enhancer.png', caption: "Hey, this Ren stuff isn't too bad!" }
  ]
}

posts_data.merge!({
  chrollo => [
    { post_type: 'text', content: "Books, silence, and loyalty. That’s all I need. 📚🕷️" }
  ],
  pakunoda => [
    { post_type: 'image', image: "MemoryBullet.png", caption: "What we remember makes us who we are." }
  ],
  feitan => [
    { post_type: 'text', content: "Pain is art. Suffer beautifully. 🔪" }
  ],
  nobunaga => [
    { post_type: 'text', content: "We need to be more like a *real* samurai squad." }
  ],
  shizuku => [
    { post_type: 'image', image: "DemeChan.png", caption: "Just cleaning up. 🧹 Don’t mind me." }
  ],
  franklin => [
    { post_type: 'text', content: "Talk less. Fire more. 🔫" }
  ],
  machi => [
    { post_type: 'text', content: "You're lucky I'm in a good mood today." }
  ],
  phinks => [
    { post_type: 'image', image: "SpinPunch.png", caption: "Warm-up complete. Who’s next? 👊" }
  ],
  shalnark => [
    { post_type: 'text', content: "This antenna might actually get 5G. 📡" }
  ],
  kortopi => [
    { post_type: 'image', image: "CloneRoom.png", caption: "Which one is real? Does it matter?" }
  ],
  bonolenov => [
    { post_type: 'text', content: "My body is my weapon. My rhythm is war. 🥁" }
  ],
  uvogin => [
    { post_type: 'text', content: "Hit me harder next time. 💥" }
  ],
  kalluto => [
    { post_type: 'image', image: "PaperDance.png", caption: "I see more than you think. ✂️" }
  ],
  silva => [
    { post_type: 'text', content: "You don’t inherit a legacy. You *prove* it." }
  ],
  zeno => [
    { post_type: 'text', content: "Live long. Die precise. 🐉" }
  ],
  illumi => [
    { post_type: 'image', image: "NeedleFace.png", caption: "What? This is my happy face." }
  ],
  kikyo => [
    { post_type: 'text', content: "My precious sons... please message me back. ☎️" }
  ],
  milluki => [
    { post_type: 'text', content: "Mom! The internet’s down again!! 😡" }
  ],
  meruem => [
    { post_type: 'text', content: "I was born to conquer. Then I learned to feel. ♟️" }
  ],
  neferpitou => [
    { post_type: 'image', image: "NenDoctor.png", caption: "You’re not dead yet. Let’s fix that. 🐾" }
  ],
  shaiapouf => [
    { post_type: 'text', content: "His majesty deserves nothing less than perfection!" }
  ],
  youpi => [
    { post_type: 'text', content: "I used to get angry. Now I just grow." }
  ],
  hisoka => [
    { post_type: 'image', image: "BungeeGum.png", caption: "Bungee Gum has the properties of both rubber and gum. 😏" }
  ],
  biscuit => [
    { post_type: 'text', content: "Don’t let the look fool you. 💅 I’ll break you in two." }
  ],
  ging => [
    { post_type: 'text', content: "The best way to be found is not to hide. It’s to move forward." }
  ],
  isaac => [
    { post_type: 'image', image: "BuddhaPalm.png", caption: "I trained for decades to become worthy of this palm. 🙏" }
  ]
})

# Create posts
users.each do |user|
  posts_data[user].each do |post_attrs|
    Post.find_or_create_by(user: user, post_type: post_attrs[:post_type], content: post_attrs[:content]) do |post|
      if post_attrs[:post_type] == 'image'
        attach_post_picture(post, post_attrs[:image])
        post.caption = post_attrs[:caption] if post_attrs[:caption]
      end
      set_timestamps(post)
    end
  end
end

puts "✅ Seeded global posts!"

### Create Group-Scoped Posts ###

# Define posts scoped to specific groups
group_posts_data = [
  { user: gon, group: Group.find_by(name: "Nen Training"), post_type: "text", content: "Nen training is harder than I thought! 😵", visibility: "group_only" },
  { user: killua, group: Group.find_by(name: "Squad Zoldyck"), post_type: "image", image: "ZoldyckMansion.png", caption: "Home sweet home. 🏠", visibility: "group_only" },
  { user: kurapika, group: Group.find_by(name: "Hunters Association"), post_type: "text", content: "The Hunter Exam was just the beginning... 🃏", visibility: "group_only" },
  { user: leorio, group: Group.find_by(name: "Medical Professionals"), post_type: "image", image: "Doctor.png", caption: "Studying hard to become the best doctor! 🩺", visibility: "group_only" }
]

group_posts_data += [
  { user: chrollo, group: Group.find_by(name: "Meteor City Originals"), post_type: "text", content: "We weren’t born from nothing — we were born from purpose. 🕷️", visibility: "group_only" },
  { user: kalluto, group: Group.find_by(name: "Phantom Newbloods"), post_type: "text", content: "Even among spiders, some threads are still forming...", visibility: "group_only" },
  { user: killua, group: Group.find_by(name: "Greed Island Party"), post_type: "image", image: "GreedIslandMap.png", caption: "Best game ever. Let’s beat it again sometime 🎮", visibility: "group_only" },
  { user: illumi, group: Group.find_by(name: "Zoldyck Assassins"), post_type: "text", content: "Our family bond is deeper than blood. It’s contractually binding.", visibility: "group_only" },
  { user: meruem, group: Group.find_by(name: "Palace of the King"), post_type: "text", content: "Loyalty is earned through purpose. You’ve all proven yourselves. ♟️", visibility: "group_only" }
]

# Create group-scoped posts
group_posts_data.each do |post_attrs|
  post = Post.find_or_create_by(user: post_attrs[:user], group: post_attrs[:group], post_type: post_attrs[:post_type], content: post_attrs[:content], visibility: post_attrs[:visibility]) do |post|
    if post_attrs[:post_type] == "image"
      attach_post_picture(post, post_attrs[:image])
      post.caption = post_attrs[:caption] if post_attrs[:caption]
    end
  end
  set_timestamps(post)
end

puts "✅ Seeded group-scoped posts!"
