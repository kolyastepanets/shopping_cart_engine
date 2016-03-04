class CreateShoppingCartCoupons < ActiveRecord::Migration
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :name
      t.integer :discount

      t.timestamps null: false
    end
  end
end
