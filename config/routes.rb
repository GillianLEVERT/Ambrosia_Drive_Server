Rails.application.routes.draw do
  namespace :api do
    post 'authentication/create'
    post 'sessions/create'
  end
end
