Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index, :show, :update, :create, :destroy ] do
        resources :comments, only: [ :create ]
      end
      resources :comments, only: [ :show, :update, :destroy ]
      get '/my-restaurants', to: 'restaurants#my_restaurants', as: :my_restaurants
    end
  end

end
