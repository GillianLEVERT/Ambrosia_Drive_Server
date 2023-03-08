Rails.application.routes.draw do
  resources :products
  namespace :api do
    post 'authentication/create'
    post 'sessions/create'
  end
end
