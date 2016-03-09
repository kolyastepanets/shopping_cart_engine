# This migration comes from shopping_cart (originally 20160303193137)
class CreateShoppingCartAddresses < ActiveRecord::Migration
  def change
    create_table :shopping_cart_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :type
      t.integer :country_id
      t.integer :zip
      t.string :phone
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
    # add_index :shopping_cart_addresses, [:addressable_type, :addressable_id]
  end
end
