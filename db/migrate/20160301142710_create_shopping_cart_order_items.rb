class CreateShoppingCartOrderItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.integer :product_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
