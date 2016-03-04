class CreateShoppingCartCreditCards < ActiveRecord::Migration
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.integer :number, limit: 8
      t.integer :cvv
      t.integer :expiration_month
      t.integer :expiration_year
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
