module ShoppingCart
  class Address < ActiveRecord::Base
    belongs_to :addressable, polymorphic: true
    belongs_to :country

    validates :first_name, :last_name, :street, :city, :zip, :phone, :country_id, presence: true

    validates :phone, format: { with: /\A[+-]?\d+?(\.\d+)?\Z/,
      message: "must have only integers" }

    validates_numericality_of :zip
  end
end
