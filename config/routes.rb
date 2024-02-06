Rails.application.routes.draw do
  # Devise setup for user authentication
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Unauthenticated root - Directs unauthenticated users to the login page
  root to: 'home#index'

  # Admin namespace
  namespace :admin do
    # Admin dashboard - Both a specific route and the root of the admin namespace
    get 'dashboard', to: 'dashboards#show'
    root to: 'dashboards#show'

    # RESTful resources within the admin namespace
    resources :users
    resources :students
    resources :courses
    resources :enrollments
  end

  # Students namespace
  namespace :students do
    # Student dashboard - Accessible to students
    get 'dashboard', to: 'dashboards#show'
  end

  resources :courses
  resources :enrollments
end
