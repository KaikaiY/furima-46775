class RenameMultipleColumnsInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :first_name_kanji, :first_name_zenkaku
    rename_column :users, :last_name_kanji, :last_name_zenkaku
    rename_column :users, :first_name_kana, :first_name_katakana
    rename_column :users, :last_name_kana, :last_name_katakana
  end
end

