module ShoppingCart
  class ApplicationController < ::ApplicationController
    before_action :set_order

    def set_order
      if current_user
        if order_in_session
          @order.update_attributes(user_id: current_user.id)
        else
          @order = current_order
        end
      else
        order_in_session
      end
    end

    def order_in_session
      begin
        @order = Order.find(session[:order_id])
      rescue
        @order = nil
      end
    end

    def current_order
      current_user.orders.in_progress.last if current_user
    end
  end
end
