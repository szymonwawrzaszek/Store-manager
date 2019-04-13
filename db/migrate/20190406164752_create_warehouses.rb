class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :address
      t.string :phone_num
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
