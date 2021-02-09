module UsersHelper
  def follow_check(user)
    if current_user != user
      followers_array = user.followers
      followers_array = followers_array.all.pluck(:id)
      if followers_array.include?(current_user.id)
        'Followed'
      else
        button_to 'Follow', follows_path(followed_id: user.id, follower_id: current_user.id)
      end
    end
  end

  def acceptable_main_image
    return unless main_image.attached?

    unless main_image.byte_size <= 1.megabyte
      errors.add(:main_image, 'is too big')
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
