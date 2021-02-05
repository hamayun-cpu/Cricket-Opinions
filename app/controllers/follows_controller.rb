class FollowsController < ApplicationController
  def create
    @follow = Follow.create(follow_params)
    redirect_to users_path
  end

  private

  def follow_params
    params.permit(:follower_id, :followed_id)
  end
end
