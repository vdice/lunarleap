class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # Devise auth prereqs
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def verify_current_user user
    if current_user && !current_user.eql?(user)
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to root_path
    end
  end
end
