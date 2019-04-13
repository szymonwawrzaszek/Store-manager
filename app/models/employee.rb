class Employee < ApplicationRecord
  belongs_to :store

  validates_presence_of :name, :surname, :position, :work_time

  validates_numericality_of :phone_num, :allow_blank => true, only_integer: true

  validates_length_of :phone_num, in: 9..9
  #validates_uniqueness_of :name

  validates_uniqueness_of :email, case_sensitive: false, :allow_blank => true,
                          message: "has already been entered, you can't sign in twice"

  validates_format_of :email, :allow_blank => true,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: "doesn't look like a proper email address"

end
