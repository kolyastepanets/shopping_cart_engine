require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
      @current_order = @order
      @in_processing = current_user.orders.in_processing.order(created_at: :ASC)
      @in_delivery = current_user.orders.in_delivery.order(created_at: :ASC)
      @delivered = current_user.orders.delivered.order(created_at: :ASC)
    end

    def show
      @old_order = current_user.orders.find(params[:id])
    end

  end
end
