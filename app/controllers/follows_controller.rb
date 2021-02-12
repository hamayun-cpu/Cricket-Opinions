class FollowsController < ApplicationController
  def create
    @follow = Follow.create(follow_params)
    use = User.find(params[:followed_id])
    redirect_to user_path(use)
  end

  private

  def follow_params
    params.permit(:follower_id, :followed_id)
  end
end
