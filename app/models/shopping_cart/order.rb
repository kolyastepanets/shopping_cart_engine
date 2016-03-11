module ShoppingCart
  class Order < ActiveRecord::Base
    include AASM
    before_save :update_total_price

    validates :aasm_state, presence: true

    belongs_to :user, polymorphic: true
    belongs_to :coupon
    belongs_to :delivery

    has_many :order_items, dependent: :destroy

    has_one :shipping_address, as: :addressable, class_name: "ShippingAddress"
    accepts_nested_attributes_for :shipping_address

    has_one :billing_address, as: :addressable, class_name: "BillingAddress"
    accepts_nested_attributes_for :billing_address

    has_one :credit_card
    accepts_nested_attributes_for :credit_card

    aasm do
      state :in_progress, initial: true
      state :in_processing
      state :in_delivery
      state :delivered
      state :canceled

      event :process do
        transitions :from => :in_progress, :to => :in_processing
      end

      event :deliver do
        transitions :from => :in_processing, :to => :in_delivery
      end

      event :ship do
        transitions :from => :in_delivery, :to => :delivered
      end

      event :cancel do
        transitions :from => [:in_processing, :in_delivery], :to => :canceled
      end
    end

    def add_product(product, quantity = 1, price)
      current_item = order_items.find_by(product: product)
      if current_item
        current_item.update_attributes(quantity: current_item.quantity + quantity.to_i)
      else
        current_item = order_items.create(product: product, quantity: quantity, price: price)
      end
    end

    def total_price
      order_items.to_a.sum { |item| item.total_price }
    end

    def total_price_with_discount
      total_price - count_discount
    end

    def delivery_price
      delivery.nil? ? 0 : delivery.price
    end

    def count_discount
      coupon.nil? ? 0 : coupon.discount * total_price / 100
    end

    def total_price_with_delivery_with_discount
      total_price_with_discount + delivery_price
    end

    def total_quantity
      order_items.to_a.sum { |item| item.quantity }
    end

    def build_both_addresses
      building_billing_address
      building_shipping_address
    end

    def building_billing_address
      unless billing_address
        if current_user && current_user.billing_address.present?
          build_billing_address(current_user.billing_address.attributes)
        else
          build_billing_address
        end
      end
    end

    def building_shipping_address
      unless shipping_address
        if current_user && current_user.shipping_address.present?
          build_shipping_address(current_user.shipping_address.attributes)
        else
          build_shipping_address
        end
      end

    end

    def building_credit_card
      build_credit_card unless credit_card
    end

  private

      def current_user
        user
      end

      def update_total_price
        self.total_price = total_price_with_delivery_with_discount
      end
  end
end
