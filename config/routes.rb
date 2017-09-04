Rails.application.routes.draw do

  resources :events, only: [ :index, :show ] do
    resources :comments, only: :create
  end

  get '/events/new', to: 'courses#show'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'courses#index'
  resources :courses do
    get 'dashboard', to: 'courses#dashboard', as: "course_dashboard"
     resources :events do
       resources :hole_scores, only: [:create]
     end
  end

  resources :users
  # API ROUTES:
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show ]
      resources :courses, only: [ :index, :show, :update, :create, :destroy ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
