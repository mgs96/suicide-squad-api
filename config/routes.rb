Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api,  defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, except: :create do
        resources :products
      end
      get "/products", to: "products#global"
      get "/products/last_ten", to: "products#last_ten"
      get "products/by_category", to: "products#by_category"
      get "/categories", to: "categories#index"
    end
  end
end
