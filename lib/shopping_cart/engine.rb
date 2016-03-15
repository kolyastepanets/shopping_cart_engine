module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.to_prepare do
      ActiveRecord::Base.send(:include, ShoppingCart::ActsAsShoppingCart)
    end

    initializer "shopping_cart.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include ShoppingCart::ApplicationControllerMethods
      end
    end

  end
end
