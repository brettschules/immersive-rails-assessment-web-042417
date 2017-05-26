Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :guests
  resources :episodes
  resources :users
  resources :sessions, only: [:new, :create]
  post '/signin' => 'sessions#new', as: 'login'
  delete '/' => 'sessions#destroy', as: 'logout'

end
