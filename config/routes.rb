Rails.application.routes.draw do
  root to: "stores#index"

  devise_for :users

  resources :stores do
    resources :employees
    member do
      get :item_list
      get :warehouses
      post :warehouse_add
      post :warehouse_remove
    end
  end

  resources :warehouses do
    resources :items
    member do
      get :assign
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
