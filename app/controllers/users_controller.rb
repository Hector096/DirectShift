class UsersController < ApplicationController
  before_action :authenticate_user! only: :user_logged_in
  def user_logged_in
    @user = current_user
    render json: {
      user: @user
    }
  end

  def invite
    @user = current_user
    email = params['email']
    ReferralMailer.send_referral(email,@user).deliver_now
    render json: {
      message: 'Invite Sent!'
    }
  end


end
