# ApplicationController is the main controller from which all other controllers inherit.
class ApplicationController < ActionController::Base
  # Skip the default Rails forgery protection
  skip_forgery_protection
  # Rescue from a Pundit::NotAuthorizedError with the user_not_authorized method
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Include Pundit's authorization methods
  #include Pundit::Authorization
  # Before any action, configure the permitted parameters if it's a Devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # If you have extra params to permit, append them to the sanitizer. 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :dob, :height, :sex, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :height, :password, :password_confirmation, :current_password])
  end

  private

  # user_not_authorized is a private method that sets a flash message and redirects the user when they are not authorized to perform an action
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end