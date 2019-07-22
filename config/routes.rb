Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'

  devise_for :users,controllers:{
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'

  resources :items do
    resources :messages
    resources :buys
    resources :likes, only: [:create, :destroy]
    collection do
      match 'search', to: 'items#search', via: [:get, :post]
    end
  end
  resources :categories, only:[:new]

  resources :sign_up, only:[:index,:show] 

  resources :addresses
  resources :phone_numbers

  resources :creditcards, only:[:new, :show] do
    collection do
      post 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end

end