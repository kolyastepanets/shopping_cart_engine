module ShoppingCart
  class Delivery < ActiveRecord::Base
    validates :name, :price, presence: true
    validates :price, numericality: true

    has_many :orders
  end
end
