module ShoppingCart
  class CreditCard < ActiveRecord::Base
    belongs_to :order

    validates :number, :expiration_month, :expiration_year, :cvv, presence: true
    validates :number, :expiration_month, :cvv, numericality: { only_integer: true }

    validates_numericality_of :expiration_year, greater_than_or_equal_to: 2016

    validates :number, length: { is: 16 }
    validates :cvv, length: { is: 3 }
  end
end
