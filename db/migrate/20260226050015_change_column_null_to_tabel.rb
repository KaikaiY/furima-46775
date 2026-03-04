class ChangeColumnNullToTabel < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :birthday, true
  end
end
