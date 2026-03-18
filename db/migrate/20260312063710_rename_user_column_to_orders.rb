class RenameUserColumnToOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :addresses, :user_id, :order_id
  end
end
