class AddUserTypeFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_type, :string, default: false, null: false
  end
end
