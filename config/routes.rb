Rails.application.routes.draw do
  root 'items#home'
  get 'discounts/index'
  get 'discounts/show'
  get 'discounts/create'
  get 'discounts/update'
  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/update'
  get 'items/index'
  get 'items/show'
  get 'items/create'
  get 'items/update'
  get 'users/index'

  resources :orders
  resources :discounts
  resources :items
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
