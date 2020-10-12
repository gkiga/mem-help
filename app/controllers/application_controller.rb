class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters,
    if: :devise_controller?
        protected

        
          
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:contact_info]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:major]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:interests]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:bio]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:last_name]) 
         end
end
