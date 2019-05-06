Rails.application.routes.draw do
  devise_for :users,controllers:{
    registrations: 'users/registrations',
  }
  root 'freemarket_sample#index'
  resources :users
  resources :freemarket_sample, only:[:index]
  resources :sign_up, only:[:index]
  resources :addresses
  resources :phone_numbers
end