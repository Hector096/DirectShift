class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @is_valid = User.exists?(:referral => params['referral'])

    if @is_valid
      user = User.new(sign_up_params)
      if user.save 
        user.referral = SecureRandom.urlsafe_base64(5)
        user.save
        render json: { message: 'Signed up sucessfully!' }
      else
        render json: { message: "Something went wrong. User already exist!" }
      end 
      
    else
      render json: { message: "Something went wrong. Maybe your referral code is invalid" }
    end
  end

  private

  # def respond_with(resource, _opts = {})
  #   register_success && return if resource.persisted?

  #   register_failed
  # end

  # def check_valid_referral(resource)
  
  #   #  @is_valid ? register_success : register_failed
  # end

  # def register_success
  #   render json: { message: 'Signed up sucessfully,', user: @user }
  # end

  # def register_failed
  #   render json: { message: "Something went wrong. Maybe your referral code is invalid or user already exist!" }
  # end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
