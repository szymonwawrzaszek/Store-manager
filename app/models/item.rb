class Item < ApplicationRecord
  belongs_to :warehouse

  validates_presence_of :name, :price, :quantity
  validates_numericality_of :price, :quantity, greater_than: 0
  validates_numericality_of :quantity,  only_integer: true

  after_save :store_photo

end
