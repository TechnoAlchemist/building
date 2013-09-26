class BuildingOwner < ActiveRecord::Base
  has_many :building_units
  inverse_of: :building_owner,
  dependent: :nullify

  validate_presence :name
end
