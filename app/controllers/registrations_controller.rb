class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully,', user: @user }
  end

  def register_failed
    render json: { message: "Something went wrong. #{resource.errors.full_messages.to_sentence}" }
  end

  def sign_up_params
    params.require(:user).permit(:name, :admin, :address, :email, :password, :password_confirmation)
  end
end
