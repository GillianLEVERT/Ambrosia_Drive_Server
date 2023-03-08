Rails.application.routes.draw do
  resources :order_items
  resources :carts
  resources :cart_items
  resources :products
  namespace :api do
    post 'authentication/create'
    post 'sessions/create'
  end
end
