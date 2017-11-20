Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :index, :show, :update ] do
        resources :products
      end
      get "/products", to: "products#global"
      get "/products/last_ten", to: "products#last_ten"
    end
  end
end
