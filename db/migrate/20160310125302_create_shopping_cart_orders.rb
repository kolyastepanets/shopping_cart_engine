class CreateShoppingCartOrders < ActiveRecord::Migration
  def change
    create_table :shopping_cart_orders do |t|
      t.string :aasm_state
      t.date :completed_date
      t.integer :delivery_id
      t.integer :coupon_id
      t.decimal :total_price
      t.belongs_to :user, polymorphic: true

      t.timestamps null: false
    end
  end
end
