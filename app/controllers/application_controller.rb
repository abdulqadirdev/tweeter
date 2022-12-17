class ApplicationController < ActionController::Base
  layout :layout_by_reference
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private

  def layout_by_reference
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :profile_image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :profile_image])
    end
end
