Rails.application.routes.draw do

  devise_for :users
  mount ShoppingCart::Engine => "/shopping_cart"
end
