class ApplicationController < ActionController::Base
  before_action :devise_permitted_parameters, if: :devise_controller?

  protected

  def devise_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_first_name ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_last_name ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday ])
  end
end
