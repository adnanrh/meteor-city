module ApplicationHelper

  # returns the path to the specified user
  # should be either the:
  # 1. profile path if current user
  # 2. friend path if another user that's a friend of the current user
  # 3. preview path if another user that's not a friend of the current user (but has mutual friends)
  # 4. profile path otherwise
  def adjusted_user_path(user)
    return profile_path if user == current_user

    return friend_path(user) if current_user.friends_with?(user)

    return preview_path(user) if current_user.mutual_friends_with(user).any?
    
    return profile_path
  end

  # return the profile picture sized for the profile page
  def profile_picture_for(user, classes: "rounded-full w-24 h-24 border border-gray-300 shadow-sm")
    if user.profile_picture.attached?
      # .variant(resize_to_fill: [100, 100])
      image_tag url_for(user.profile_picture), alt: "#{user.username}'s Profile Picture", class: classes
    else
      content_tag :p, "No profile picture uploaded."
    end
  end

  # return the profile picture sized for the profile page that also links to the user's profile
  def linked_profile_picture_for(user)
    link_to adjusted_user_path(user) do
      profile_picture_for(user)
    end
  end

  # return the profile picture sized posts and comments
  def post_profile_picture_for(user)
    profile_picture_for(user, classes: "w-10 h-10 rounded-full object-cover")
  end

  # return the profile picture sized for posts and comments that also links to the user's profile
  def linked_post_profile_picture_for(user)
    link_to adjusted_user_path(user) do
      post_profile_picture_for(user)
    end
  end
  
  def post_image_for(post, classes: "rounded-lg max-w-full h-auto w-full sm:w-[500px] mt-2 object-cover")
    if post.image.attached?
      # .variant(resize_to_limit: [500, 500])
      image_tag url_for(post.image), alt: "Post Image", class: classes
    else
      content_tag :p, "No image uploaded."
    end
  end

  def form_field_classes
    "form-input w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
  end

  def form_button_classes
    "bg-blue-500 text-white font-semibold py-2 px-4 rounded-lg border border-gray-900 shadow-md hover:bg-blue-600 transition mt-4 mb-2"
  end

  def no_posts_message_for(path)
    case path
    when /\/home/
      "No posts to show yet. Connect with friends to see their posts."
    when /\/profile/
      "You haven't posted anything yet."
    when /\/friends\/\d+/
      "No posts from this friend yet."
    when /\/archives/
      "You don't have any archived posts yet."
    else
      "No posts found."
    end
  end

  def end_of_posts_message_for(path)
    case path
    when /\/home/
      "You have reached the end of your community's posts."
    when /\/profile/
      "You've reached the end of your posts."
    when /\/friends\/\d+/
      "You’ve reached the end of this friend's posts."
    when /\/archives/
      "You've reached the end of your archived posts."
    else
      "You’ve reached the end of the posts."
    end
  end
end
  