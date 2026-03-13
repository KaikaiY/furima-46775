class FixForeignKeyOnAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :addresses, column: :order_id
    add_foreign_key :addresses, :orders, column: :order_id
  end
end
