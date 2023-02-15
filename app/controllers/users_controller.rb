class UsersController < ApplicationController
  before_action :authenticate_user!
  def user_logged_in
    @user = current_user
    render json: {
      user: @user
    }
  end

  def invite
    @user = current_user
    email = params['email']
    begin
      ReferralMailer.send_referral(email,@user.referral).deliver_now
      render json: {
        message: 'Invite Sent!'
      }
      rescue Exception => exc
        render json: {
          message: 'Failed to sent invite!',
        },:status => 401
      end
  end
end
