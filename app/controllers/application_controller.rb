class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters,
    if: :devise_controller?
        protected

        
#allows other attributes to be inputted from devise forms into user class          
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
            devise_parameter_sanitizer.permit(:sign_up, keys: [:contact_info]) 
            devise_parameter_sanitizer.permit(:sign_up, keys: [:major]) 
            devise_parameter_sanitizer.permit(:sign_up, keys: [:interests]) 
            devise_parameter_sanitizer.permit(:sign_up, keys: [:bio]) 
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name]) 
            devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:contact_info]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:major]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:interests]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:bio]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:last_name]) 
         end
end
