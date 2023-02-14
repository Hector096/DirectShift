class RegistrationsController < Devise::RegistrationsController
  before_action :check_valid_referral
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def check_valid_referral
    @user = User.exists?(:referral => params['referral'])
     @user ? register_success : register_failed
  end

  def register_success
    @user.referral = SecureRandom.base64(5)
    @user.save
    render json: { message: 'Signed up sucessfully,', user: @user }
  end

  def register_failed
    render json: { message: "Something went wrong. Maybe your referral code is invalid or user already exist!" }
  end

  def sign_up_params
    params.require(:user).permit(:name, :admin, :address, :email, :password, :password_confirmation)
  end
end
