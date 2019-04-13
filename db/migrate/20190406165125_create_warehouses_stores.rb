class CreateWarehousesStores < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses_stores do |t|
      t.integer :warehouse_id, null: false
      t.integer :store_id, null: false
    end

    add_index :warehouses_stores, [:warehouse_id, :store_id], unique: true
    end
  end
