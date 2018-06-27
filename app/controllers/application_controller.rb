class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  # before_filter :configure_permitted_parameters, if: :devise_controller?

	protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :username, :image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

 def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
