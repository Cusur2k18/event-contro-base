Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    post '/students/login', to: 'students#login', as: :udg_login
    put '/students/assistance', to: 'students#assistance', as: :check_assistance
    get '/students/enrollments', to: 'students#my_enrollments', as: :current_user_enrollments
    post '/events/enroll', to: 'events#enroll', as: :enrollment
    delete '/events/rescind', to: 'events#rescind', as: :enrollment_rescind
    resources :students
    resources :events, only: [:index, :show]
  end
end
