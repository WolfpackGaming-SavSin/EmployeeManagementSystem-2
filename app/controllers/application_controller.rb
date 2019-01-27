class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:email, :password, :role, :status])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:email, :password, :role, :status])
    end

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to view this page."
      redirect_to(request.referrer || root_path)
    end
end
