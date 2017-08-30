Rails.application.routes.draw do

  # get 'courses/index'
  #
  # get 'courses/show'
  #
  # get 'courses/new'
  #
  # get 'courses/create'


  # get 'users/show'
  # get 'users/friends'


  # get 'events/show'

  # get 'events/create'

  # get 'events/index'

  get '/events/new', to: 'courses#show'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'courses#index'
  resources :courses do
    resources :events, only: :create
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
