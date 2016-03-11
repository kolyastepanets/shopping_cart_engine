Rails.application.routes.draw do
  resources :books

  root to: "books#index"

  devise_for :users
  mount ShoppingCart::Engine => "/shopping_cart"
end
