Rails.application.routes.draw do
  resources :store_shelves
  resources :stores
  resources :orders
  resources :order_items
  resources :carts
  resources :cart_items
  resources :products
  scope '/paiement' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'succes', to: 'checkout#success', as: 'checkout_success'
    get 'annulation', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  namespace :api do
    post 'authentication/create'
    post 'sessions/create'
  end
end
