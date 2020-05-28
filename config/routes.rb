Rails.application.routes.draw do
  get '/my_profile', to: 'users#show'
  devise_for :users
  root to:'home#index'
  resources :companies,only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :games, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
