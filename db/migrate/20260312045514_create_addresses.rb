class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string     :post_code,        null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city,             null: false
      t.string     :address,          null: false
      t.string     :building_name,    null: true
      t.string     :phone_number,     null: false
      t.references :user,             null: false, foreign_key: :user_id

      t.timestamps
    end
  end
end


