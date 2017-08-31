Rails.application.routes.draw do

  resources :events, only: [ :index, :show ] do
    resources :comments, only: :create
  end

  get '/events/new', to: 'courses#show'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'courses#index'
  get '/courses/dashboard', to: 'courses#dashboard', as: "course_dashboard"
  resources :courses do
     resources :events
  end

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
