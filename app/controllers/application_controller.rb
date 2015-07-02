class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   
  
    protected
      def after_sign_in_path_for (user)
        if user_signed_in? && current_user.user_detail.present?
          return user_detail_path(current_user.user_detail)
        elsif user_signed_in? && current_user.user_detail.nil?
            return new_user_detail_path
          else
            return root_url
           end
      end
  
  
      def after_sign_out_path_for(user)
        return root_url
      end
  
   # def after_inactive_sign_up_path_for(user)
    #  return home_page_successful_registration_path
   # end
    
    def after_sign_up_path_for(user)
      return home_page_successful_registration_path
    end
       # else
        #  return root_url
    #end
      #end
    
 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
 end
  
end
