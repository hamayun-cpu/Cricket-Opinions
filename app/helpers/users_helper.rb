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
end
