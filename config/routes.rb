Rails.application.routes.draw do

  devise_for :users,controllers:{
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'

  resources :users
  resources :items do
    resources :messages
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