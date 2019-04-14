class AddPhotoExtensionToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :extension, :string
  end
end
