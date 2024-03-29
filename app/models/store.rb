class Store < ApplicationRecord
  has_and_belongs_to_many :warehouses
  has_many :employees, dependent: :destroy

  def assigned_in?(warehouse)
    self.warehouses.include?(warehouse)
  end

  def unassigned_warehouses
    Warehouse.all - self.warehouses
  end

  validates_presence_of :name, :address, :phone_num, :email

  validates_numericality_of :phone_num, only_integer: true
  validates_length_of :phone_num, in: 9..9
  validates_uniqueness_of :name, :phone_num

  validates_uniqueness_of :email, case_sensitive: false,
                          message: "has already been entered, you can't sign in twice"

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: "doesn't look like a proper email address"
end
