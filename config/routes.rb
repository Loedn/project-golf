Rails.application.routes.draw do

  # get 'courses/index'
  #
  # get 'courses/show'
  #
  # get 'courses/new'
  #
  # get 'courses/create'

  get 'events/show'

  get 'events/create'

  get 'events/index'


  devise_for :users
  root to: 'courses#index'
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
