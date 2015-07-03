 Rails.application.routes.draw do
  
   devise_for :users, path_names:{sign_in: "login", sign_up: "new_user_registration"}, :controllers => { :registrations => 'registrations' }
   #, :controllers => { :passwords => "passwords" }

   
   devise_scope :user do
    root to: "devise/sessions#new"
   end
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'homepage#index'
  # root 'devise/sessions#new'
   
   get 'users/user_profile_picture' => 'users#user_profile_picture'
   get 'doctor_visits/doctor_visit_member' => 'doctor_visits#doctor_visit_member'
   get 'health_records/health_record_member' => 'health_records#health_record_member'
   get 'doctor_visits/member_doctor_visit_new' => 'doctor_visits#member_doctor_visit_new'
   post 'doctor_visits/member_doctor_visit_create' => 'doctor_visits#member_doctor_visit_create'
   get 'health_records/member_health_record_new' => 'health_records#member_health_record_new'
   post 'health_records/member_health_record_create' => 'health_records#member_health_record_create'
   get 'homepage/succesful_registration' => 'homepage#successful_registration'
   #post 'user_details/doctor_visit_update' => 'user_details#doctor_visit_update'
   
     resources :users
     resources :user_details
     resources :doctor_visits
     resources :health_records
     resources :family_members
    
    
 

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
