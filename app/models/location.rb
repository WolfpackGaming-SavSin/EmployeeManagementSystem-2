class Location < ApplicationRecord
  has_and_belongs_to_many :employees

  validates_length_of :state, :maximum => 2
end
