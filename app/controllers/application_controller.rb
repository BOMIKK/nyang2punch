class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:address,:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:address,:phone_number])
  end
  
  # 로그인 하지 않고 new 한 경우 로그인 페이지로 이동
  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_url, :alert => exception.message
    redirect_to user_session_url, :alert => exception.message
  end

end
