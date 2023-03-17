Rails.application.routes.draw do
  resources :store_shelves
  resources :stores
  resources :orders
  resources :order_items
  resources :carts
  resources :cart_items
  resources :products
  namespace :api do
    post 'authentication/create'
    post 'sessions/create'
    resources :appointments
  end
end
