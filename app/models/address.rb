class Address < ApplicationRecord
  validates_presence_of :city, :state
  belongs_to :location
end
