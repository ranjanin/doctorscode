class RegistrationsController < Devise::RegistrationsController
 

 def create 
    build_resource(sign_up_params) 
    if resource.save 
      yield resource if block_given? 
      if resource.active_for_authentication? 
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
     else 
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
     expire_session_data_after_sign_in!
      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        flash[:notice] = "Activation Email is sent to your registered Email ID"
     end
    end
 end
  
   # else 
      #clean_up_passwords resource
     
    #  flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
     
    # redirect_to root_path 
      #end
 # end
  
  
  protected

  def after_inactive_sign_up_path_for(resource)
    return root_url
  end
  
end