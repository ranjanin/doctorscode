class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user
 # before_filter {|c| Authorization.current_user = c.current_user}
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
     def set_current_user
       User.current = current_user
    end
  
    protected
      def after_sign_in_path_for (user)
        if user_signed_in? && current_user.user_detail.present?
          if current_user.user_detail.role == "Member"
             return user_detail_path(current_user.user_detail)
          elsif current_user.user_detail.role == "Doctor"
            if current_user.doctors.first.first_name.present?
               return doctor_path(current_user.doctors.first.id)
             else
               return new_doctor_path
             end             
          end
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
   #  return new_user_session_path
  # end
    
   def after_sign_up_path_for(user)
      return root_url
   end
       # else
        #  return root_url
   # end
      #end
    
 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
 end
  
end
