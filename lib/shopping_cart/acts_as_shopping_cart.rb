module ShoppingCart
  module ActsAsShoppingCart
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_user
        class_eval do
          has_many :orders, class_name: 'ShoppingCart::Order',
                            dependent: :destroy, as: :user
        end
      end

      def acts_as_product
        PRODUCTS.push(self.name).uniq!
        class_eval do
          has_many :order_items, class_name: 'ShoppingCart::OrderItem', as: :product

          scope :bestsellers, -> { self.select("#{self.table_name}.*, sum(shopping_cart_order_items.quantity) as total").joins(:order_items).group(:id).order('total DESC').limit(3) }
        end
      end
    end
  end
end
