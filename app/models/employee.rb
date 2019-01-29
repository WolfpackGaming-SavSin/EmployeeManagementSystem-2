class Employee < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :securities
  has_and_belongs_to_many :programs

  belongs_to :manager, :class_name => 'Employee', optional: true
  has_many :subordinate, :class_name => 'Employee', :foreign_key => 'manager_id'

  def display_name
    "#{first_name} #{last_name}"
  end
end
