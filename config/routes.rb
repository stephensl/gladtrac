Rails.application.routes.draw do
  resources :students
  get 'dashboard/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'dashboard#index'

  namespace :admin do
    root 'dashboard#index'
    resources :users
    resources :teachers 
    resources :counselors 
    resources :courses
    resources :schedules
    resources :academic_plans
  end
end

