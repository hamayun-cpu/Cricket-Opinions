class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @new_opinion = Opinion.new
    @user = User.find(params[:id])
  end
end
