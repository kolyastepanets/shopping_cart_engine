class CreateShoppingCartOrderItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.integer :order_id
      t.belongs_to :product, polymorphic: true

      t.timestamps null: false
    end
  end
end
