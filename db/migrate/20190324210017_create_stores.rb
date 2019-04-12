class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :phone_num
      t.string :email
      t.text :opening_hours

      t.timestamps
    end
  end
end
