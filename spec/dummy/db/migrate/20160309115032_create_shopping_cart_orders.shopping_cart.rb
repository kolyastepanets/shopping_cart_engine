# This migration comes from shopping_cart (originally 20160301144340)
class CreateShoppingCartOrders < ActiveRecord::Migration
  def change
    create_table :shopping_cart_orders do |t|
      t.decimal :total_price
      t.date :completed_date
      t.string :aasm_state
      t.integer :user_id
      t.integer :delivery_id
      t.integer :coupon_id

      t.timestamps null: false
    end
  end
end
