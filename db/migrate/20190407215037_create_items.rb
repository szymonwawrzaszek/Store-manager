class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :warehouse_id
      t.string :name
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
