Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    get '/students/login', to: 'students#login', as: :udg_login
    resources :students
    resources :events
    resources :enrollments
  end
end
