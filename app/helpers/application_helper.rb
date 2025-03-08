module ApplicationHelper
    def profile_picture_for(user, classes: "rounded-full w-24 h-24 border border-gray-300 shadow-sm")
      if user.profile_picture.attached?
        # .variant(resize_to_fill: [100, 100])
        image_tag url_for(user.profile_picture), alt: "Profile Picture", class: classes
      else
        content_tag :p, "No profile picture uploaded."
      end
    end

    def post_image_for(post, classes: "rounded-lg max-w-full mt-2")
      if post.image.attached?
        # .variant(resize_to_limit: [500, 500])
        image_tag url_for(post.image), alt: "Post Image", class: classes
      else
        content_tag :p, "No image uploaded."
      end
    end

    def form_button_classes
      "bg-blue-500 text-white font-semibold py-2 px-4 rounded-lg border border-blue-700 hover:bg-blue-600 transition"
    end
  end
  