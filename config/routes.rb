Rails.application.routes.draw do

  resources :users
  resources :ideas
  resources :likes
  resources :sessions

  get '/' => 'users#index'
  get 'main' => 'users#index'
  get '/idea/:id' => 'ideas#show'

end
