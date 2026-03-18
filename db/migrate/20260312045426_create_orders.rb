class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: :item_id
      t.references :user, null: false, foreign_key: :user_id

      t.timestamps
    end
  end
end
