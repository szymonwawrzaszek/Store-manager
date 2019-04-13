class WarehouseTypeRename < ActiveRecord::Migration[5.1]
  def change
    rename_column :warehouses, :type, :warehouse_type
  end
end
