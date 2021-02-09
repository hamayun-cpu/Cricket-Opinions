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

  def follower(user)
    followers_array = user.followers
    followers_array = followers_array.all.pluck(:id)
    followers_array.include?(current_user.id)
  end

  def users_which_are_not_followed
    u = []
    User.order('created_at DESC').each do |us|
      u << us if current_user != us && !follower(us)
    end
    u[0..2]
  end
end
