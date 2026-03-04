class ChangeColumnNullToTabel2 < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :birthday, false
  end
end
