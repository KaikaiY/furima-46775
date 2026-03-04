class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string     :item_name,        null: false
      t.text       :item_description, null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :fee_id,           null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :delivery_id,      null: false
      t.bigint     :price,            null: false
      t.references :user,             null: false, foreign_key: :user_id
      
      t.timestamps
    end
  end
end
