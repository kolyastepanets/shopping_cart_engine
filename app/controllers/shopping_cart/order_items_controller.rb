require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    before_action :set_current_order
    before_action :load_order_item, only: :destroy

    def create
      if @order.add_product(params[:product_id], params[:quantity], params[:price])
        redirect_to cart_path
      else
        redirect_to product_path(params[:product_id])
      end
    end

    def destroy
      @order_item.destroy
      if @order.order_items.empty?
        @order.destroy
        redirect_to main_app.books_path
      else
        redirect_to cart_path
      end
    end

    private

      def load_order_item
        @order_item = @order.order_items.find(params[:id])
      end

      def set_current_order
        if current_user
          current_order ? @order = current_user_order : create_order
        else
          set_session_order
        end
      end

      def set_session_order
        begin
          @order = Order.find(session[:order_id])
        rescue
          @order = Order.create
          session[:order_id] = @order.id
        end
      end

      def create_order
        @order = current_user.orders.create
      end
  end
end
