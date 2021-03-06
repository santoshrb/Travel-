Rails.application.routes.draw do
  resources :inwords do
    collection do
      get :show_inword_detail
      get :datewise_inword
      post :show_datewise_inword
      get :show_datewise_inword
      post :create_inword
      get :bookingwise_inword
      get :show_bookingwise_inword
      post :show_bookingwise_inword
    end
  end
  resources :outwords do
    collection do
      get :show_outword_detail
      get :datewise_outword
      post :show_datewise_outword
      get :show_datewise_outword
    end
  end
  resources :roles do
    collection do
      get :role_edit_list
      get :edit_role
      post :update_role
    end
  end
  resources :file_processes
  resources :agents
  resources :booking_communications do
    collection do
      get :booking_communication_detail
    end
  end
  resources :document_lists do 
    collection do
      get :document_detail
    end
  end
  resources :vehicle_bookings do
    collection do
      get :confirm_document
      get :bookings_detail
      get :booking_info
      get :ajax_document_list
      post :document_list_confirm
      get :branchwise_booking
      get :ajax_communication_detail
      get :vehicle_booking_detail
      get :ajax_inword_detail
    end
  end
  resources :showroom_masters do
    collection do
      get :showroom_detail
      get :import_xl
      post :import
      get :show_showroom_detail
    end
  end
  resources :document_masters
  resources :financer_masters do
    collection do
      get :financer_detail
      get :import_xl
      post :import
      get :show_financer_detail
    end
  end
  resources :vehicle_types
  resources :schemes do
    collection do
      get :scheme_detail
      get :import_xl
      post :import
    end
  end
  resources :enquiries do
    collection do
      get :display_scheme
      post :display_scheme
      post :scheme_list
      get :datewise_report
      post :show_datewise_enquiry
      get :datewise_enquiry_report
      post :show_enquiry
      get :show_enquiry
      get :branchwise_enquiry
      get :show_enquiry_detail
    end
  end
  resources :employees do
    collection do
      get :assign_role
      post :submit_form
      get :user_list_for_update_password
      get :reset_password
    end
  end

  resources :branches
  resources :companies
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home
  
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }

  devise_scope :users do
    get '/users' => 'users/sessions#new'
  end

  namespace :api do
    resources :user_auths,:only => [:create], defaults: {format: 'json'}
    post 'user_auths/user_sign_in' => 'user_auths#user_sign_in', defaults: {format: 'json'}
    get  'user_auths/company_profile' => 'user_auths#company_profile', defaults: {format: 'json'}
    get  'user_auths/branch_list' => 'user_auths#branch_list', defaults: {format: 'json'}
    post 'user_auths/create_employee1' => 'user_auths#create_employee1', defaults: {format: 'json'}
    post 'user_auths/create_enquiry' => 'user_auths#create_enquiry', defaults: {format: 'json'}
    get  'user_auths/enquiry_list' => 'user_auths#enquiry_list', defaults: {format: 'json'}
    post 'user_auths/create_scheme' => 'user_auths#create_scheme', defaults: {format: 'json'}
    get  'user_auths/schemes_list' => 'user_auths#schemes_list', defaults: {format: 'json'}
    get  'user_auths/employee_list' => 'user_auths#employee_list', defaults: {format: 'json'}
    get  'user_auths/enquiry_wise_schemes' => 'user_auths#enquiry_wise_schemes', defaults: {format: 'json'}
    get  'user_auths/all_vehical_type' => 'user_auths#all_vehical_type', defaults: {format: 'json'}
    post 'user_auths/create_branch' => 'user_auths#create_branch', defaults: {format: 'json'}
    post 'user_auths/create_vehicle' => 'user_auths#create_vehicle', defaults: {format: 'json'}
    post 'user_auths/create_document_list' => 'user_auths#create_document_list', defaults: {format: 'json'}
    get  'user_auths/all_document_list' => 'user_auths#all_document_list', defaults: {format: 'json'}
    post 'user_auths/create_document_master' => 'user_auths#create_document_master', defaults: {format: 'json'}
    get  'user_auths/all_document_master' => 'user_auths#all_document_master', defaults: {format: 'json'}
    post 'user_auths/create_financer_master' => 'user_auths#create_financer_master', defaults: {format: 'json'}
    get  'user_auths/all_financer_master' => 'user_auths#all_financer_master', defaults: {format: 'json'}
    post 'user_auths/create_showroom_master' => 'user_auths#create_showroom_master', defaults: {format: 'json'}
    get  'user_auths/all_showroom_master' => 'user_auths#all_showroom_master', defaults: {format: 'json'}
    get  'user_auths/current_employee' => 'user_auths#current_employee', defaults: {format: 'json'}
    post 'user_auths/create_booking' => 'user_auths#create_booking', defaults: {format: 'json'}
    get  'user_auths/vehicle_booking_list' => 'user_auths#vehicle_booking_list', defaults: {format: 'json'}
    get  'user_auths/enquiry_type' => 'user_auths#enquiry_type', defaults: {format: 'json'}
    get  'user_auths/particular_enquiry_list' => 'user_auths#particular_enquiry_list', defaults: {format: 'json'}
    get  'user_auths/particular_vehicle_booking_list' => 'user_auths#particular_vehicle_booking_list', defaults: {format: 'json'}
    get  'user_auths/date_wise_schemes_list' => 'user_auths#date_wise_schemes_list', defaults: {format: 'json'}
    get  'user_auths/agent_list' => 'user_auths#agent_list', defaults: {format: 'json'}
    post  'user_auths/create_agent' => 'user_auths#create_agent', defaults: {format: 'json'}
    get  'user_auths/destroy_agent' => 'user_auths#destroy_agent', defaults: {format: 'json'}
    get  'user_auths/destroy_financer' => 'user_auths#destroy_financer', defaults: {format: 'json'}
    get  'user_auths/destroy_showroom' => 'user_auths#destroy_showroom', defaults: {format: 'json'}
    get  'user_auths/destroy_schemes' => 'user_auths#destroy_schemes', defaults: {format: 'json'}
    get  'user_auths/destroy_vehicle' => 'user_auths#destroy_vehicle', defaults: {format: 'json'}
    get  'user_auths/destroy_document' => 'user_auths#destroy_document', defaults: {format: 'json'}
    get  'user_auths/particular_date_wise_schemes_list' => 'user_auths#particular_date_wise_schemes_list', defaults: {format: 'json'}
  end
end
