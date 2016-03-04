ShoppingCart::Engine.routes.draw do
  resources :order_items, only: [:create, :destroy]

  resource :cart, only: [:show, :update, :destroy] do
    member do
      patch :update_info
    end
  end

  resources :orders, only: [:index, :show]

  resources :checkout, only: [:show, :update] do
    member do
      get :completed
    end
  end
end
