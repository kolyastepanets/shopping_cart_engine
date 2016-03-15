ShoppingCart::Engine.routes.draw do
  resources :order_items, only: [:create, :destroy]

  resource :cart, only: [:show, :update, :destroy]

  resources :orders, only: [:index, :show]

  resources :checkout, only: [:show, :update] do
    member do
      get :completed
    end
  end

  root "carts#show"
end
