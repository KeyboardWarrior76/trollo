class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:sign_up, :sign_in, :home]
    before_action :configure_permitted_params, if: :devise_controller?

    protected
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
        end

        def after_sign_in_path_for(resource)
            return current_user
        end
end
