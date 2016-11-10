class Trip < ApplicationRecord
  has_many :locations, dependent: :destroy

  def self.by_name
    order(:destination)
  end

end
