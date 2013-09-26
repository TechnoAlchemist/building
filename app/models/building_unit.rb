class BuildingUnit < ActiveRecord::Base
  belongs_to :building_owner,
  inverse_of: :building_units
  
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  
  validates_format_of :postal_code, 
  with: /\d{5}(-\d{4})?/
end
