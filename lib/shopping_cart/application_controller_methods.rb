module ShoppingCart
  module ApplicationControllerMethods
    require "active_support/concern"
    extend ActiveSupport::Concern

    included do
      before_action :set_order
    end

    def set_order
      if current_user
        if order_in_session
          @order.update_attributes(user_id: current_user.id)
        else
          @order = current_user_order
        end
      else
        order_in_session
      end
    end

    def order_in_session
      begin
        @order = ShoppingCart::Order.find(session[:order_id])
      rescue
        @order = nil
      end
    end

    def current_user_order
      current_user.orders.in_progress.last if current_user
    end

  end
end
