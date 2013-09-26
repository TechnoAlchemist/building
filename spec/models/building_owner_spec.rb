require 'spec_helper'

describe BuildingOwner do
  it { should have_many :building_unit }
  it { should have_valid (:name).when("Charles", "Henry", "Rebbeca", "Gloria")}
  it { should_not have_valid (:name).when("Charles", "Henry", "Rebbeca", "Gloria")}
end
