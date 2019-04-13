class CreateStoresWarehouses < ActiveRecord::Migration[5.1]
  def change
    rename_table :warehouses_stores, :stores_warehouses
  end
end
