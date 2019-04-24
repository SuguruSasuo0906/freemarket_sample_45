Rails.application.routes.draw do
  devise_for :users
  root 'freemarket_sample#index'
  resources :freemarket_sample
  resources :sign_up, only:[:index]
end
