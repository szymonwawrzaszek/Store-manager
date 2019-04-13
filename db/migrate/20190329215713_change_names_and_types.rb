class ChangeNamesAndTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :stores, :opening_hours, :text
    #rename_column :stores, :phone, :phone_num
  end
end
