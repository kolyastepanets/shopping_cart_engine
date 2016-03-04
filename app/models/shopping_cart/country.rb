module ShoppingCart
  class Country < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
  end
end
