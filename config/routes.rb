Rails.application.routes.draw do
  resources :document_lists
  resources :vehicle_bookings do
    collection do
      get :bookings_detail
      get :booking_info
      get :ajax_document_list
      post :document_list_confirm
      get :branchwise_booking
    end
  end
  resources :showroom_masters do
    collection do
      get :showroom_detail
      get :import_xl
      post :import
    end
  end
  resources :document_masters
  resources :financer_masters do
    collection do
      get :financer_detail
      get :import_xl
      post :import
    end
  end
  resources :vehicle_types
  resources :schemes
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
    end
  end
  resources :employees
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
    get  'user_auths/all_vehicle_type' => 'user_auths#all_vehicle_type', defaults: {format: 'json'}
    post 'user_auths/create_branch' => 'user_auths#create_branch', defaults: {format: 'json'}
    
  end
end