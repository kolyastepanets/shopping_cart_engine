require 'rails/generators'

module ShoppingCart
  class SettingsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      rake 'shopping_cart:install:migrations'
      route 'mount ShoppingCart::Engine, at: "/shopping"'
      prepend_to_file 'db/seeds.rb' do
        'ShoppingCart::Delivery.create([
             { name: "UPS Ground", price: 5 },
             { name: "UPS Two Day", price: 10 },
             { name: "UPS One Day", price: 15 }
           ])'
      end
      copy_file "cart.png", "app/assets/images/cart.png"
      copy_file "cross.png", "app/assets/images/cross.png"
    end

  end
end
