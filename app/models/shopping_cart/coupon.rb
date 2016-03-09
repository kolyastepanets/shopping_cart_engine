module ShoppingCart
  class Coupon < ActiveRecord::Base
    has_one :order

    validates :name, :discount, presence: true
    validates :discount, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 90}
  end
end
