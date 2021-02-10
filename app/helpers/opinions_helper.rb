module OpinionsHelper
  def profile_pic_rounded(user)
    if user.main_image.attached?
      image_tag user.main_image, class: 'profile-pic rounded-circle'
    else
      image_tag('profile.png', class: 'rounded-circle', height: 70, width: 70)
    end
  end
end
