module ShoppingCart
  class OrderItem < ActiveRecord::Base
    before_save :finalize

    validates_numericality_of :quantity, presence: true, only_integer: true, greater_than_or_equal_to: 1

    # belongs_to :product, class_name: "Book"
    belongs_to :order
    belongs_to :book

    def unit_price
      if persisted?
        self.price
      else
        book.price
      end
    end

    def total_price
      price * quantity
    end

    private

      def finalize
        self.price = unit_price
      end
  end
end
