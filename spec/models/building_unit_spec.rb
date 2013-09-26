require 'spec_helper'

describe BuildingUnit do
  it { should belong_to :building_owner}
  
  it { should have_valid(:street_address).when("33 Leaf Rd")}
  it { should_not have_valid(:street_address).when(nil, "")}

  it { should have_valid(:city).when("Cambridge")}
  it { should_not have_valid(:city).when(nil, "")}

  it { should have_valid(:state).when("MA")}
  it { should_not have_valid(:state).when(nil, "")}

  it { should have_valid(:postal_code).when(22140)}
  it { should_not have_valid(:postal_code).when(nil, "asdf", 123)}
end
