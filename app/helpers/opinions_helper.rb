module OpinionsHelper
  def profile_pic_rounded(user)
    if user.main_image.attached?
      image_tag user.main_image, class: 'profile-pic rounded-circle'
    else
      image_tag('profile.png', class: 'rounded-circle', height: 70, width: 70)
    end
  end

  def big_profile_pic_rounded(user)
    if user.main_image.attached?
      image_tag user.main_image, class: 'bigger-profile-pic rounded-circle'
    else
      image_tag('profile.png', class: 'rounded-circle', height: 72, width: 72)
    end
  end

  def card_profile_pic_rounded(user)
    if user.main_image.attached?
      image_tag user.main_image, class: 'profile-pic rounded'
    else
      image_tag('profile.png', class: 'profile-pic rounded')
    end
  end
end
