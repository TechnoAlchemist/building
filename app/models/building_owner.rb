class BuildingOwner < ActiveRecord::Base
  has_many :building_units,
  inverse_of: :building_owner,
  dependent: :nullify

  validates_presence_of :name
end
