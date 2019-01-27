class Employee < ApplicationRecord

  belongs_to :manager, :class_name => 'Employee', optional: true
  has_many :subordinate, :class_name => 'Employee', :foreign_key => 'manager_id'

  def display_name
    "#{first_name} #{last_name}"
  end
end
