class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit({ interests: [] }, :email, :password, :password_confirmation, :name, :user_name, :cpf, :address, :is_professional, :is_available)
    end

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
