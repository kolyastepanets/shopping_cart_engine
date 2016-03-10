require 'rails/generators'

module ShoppingCart
  class ViewsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_views
      directory 'carts', 'app/views/shopping_cart/carts'
      directory 'checkout', 'app/views/shopping_cart/checkout'
      directory 'orders', 'app/views/shopping_cart/orders'
    end
  end
end
