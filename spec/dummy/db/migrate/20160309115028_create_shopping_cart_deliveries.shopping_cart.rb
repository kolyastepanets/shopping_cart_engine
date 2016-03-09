# This migration comes from shopping_cart (originally 20160301140336)
class CreateShoppingCartDeliveries < ActiveRecord::Migration
  def change
    create_table :shopping_cart_deliveries do |t|
      t.decimal :price
      t.string :name

      t.timestamps null: false
    end
  end
end
