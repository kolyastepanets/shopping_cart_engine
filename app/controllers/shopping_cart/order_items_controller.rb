require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :set_current_order

    def create
      # authorize! :create, OrderItem
      if @order.add_book(params[:book_id], params[:quantity], params[:price])
        redirect_to cart_path
      else
        redirect_to book_path(params[:book_id])
      end
    end

    def destroy
      # authorize! :destroy, OrderItem
      order_item = @order.order_items.find(params[:id])
      order_item.destroy
      if @order.order_items.empty?
        @order.destroy
        redirect_to books_path
      else
        redirect_to cart_path
      end
    end

    private

      def set_current_order
        if current_user
          current_order ? @order = current_order : create_order
        else
          begin
            @order = Order.find(session[:order_id])
          rescue
            @order = Order.create
            session[:order_id] = @order.id
          end
        end
      end

      def create_order
        @order = current_user.orders.create
      end
  end
end
