class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone
  

  def set_user_time_zone
    session[:time_zone] = params[:time_zone]
    head :ok
  end

  protected

  def set_time_zone(&block)
    Time.use_zone(session[:time_zone] || 'UTC', &block)
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:height, :dob, :sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:height])
  end
end
  