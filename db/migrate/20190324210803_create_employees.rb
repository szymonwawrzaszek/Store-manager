class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :store_id
      t.string :name
      t.string :surname
      t.string :phone_num
      t.string :email
      t.string :position
      t.string :work_time

      t.timestamps
    end
  end
end
