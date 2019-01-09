Rails.application.routes.draw do
  root to: 'landing#index'
  namespace :api do
    resources :products
    resources :orders
    resources :sample, only: :index
  end
end
