Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Check if the user is signed in and has the role of student or admin
  authenticated :user, ->(user) { user.student? || user.admin? } do
    root 'users#show', as: :authenticated_root
  end

  # If the user is not signed in or doesn't have the required roles, root to the login page
  unauthenticated do
    root to: 'devise/sessions#new'
  end

  namespace :admin do
    root 'dashboard#show'
    resources :users
    resources :students
    resources :courses
    resources :enrollments
  end

  namespace :students do
    root 'users/students#show'
    resources :courses, only: [:index, :show] do
      resources :enrollments, only: [:index, :show]
    end
  end
end