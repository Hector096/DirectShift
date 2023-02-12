class UsersController < ApplicationController
  before_action :authenticate_user!
  def user_logged_in
    @user = current_user
    render json: {
      user: @user,
      orders: @user.orders
    }
  end

  def index
    @users = User.all
    render json: {
      users: @users
    }
  end
end
