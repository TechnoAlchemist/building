require 'spec_helper'

feature "records each building in portfolio", %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do
# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format, the building is recorded.
# * If I do not specify all of the required information in the required formats, 
# * the building is not recorded and I am presented with errors
# * Upon successfully creating a building, 
# * I am redirected so that I can record another building.
# * When recording a building, 
# * I want to optionally associate the building with its rightful owner.
# * If I delete an owner, the owner and 
# * its primary key should no longer be associated with any properties.

# Also Covers:
# As a real estate associate
# I want to match an owner of a building
# So that I can refer back to pertinent information


scenario "user submits valid information" do
  owner_name = "Gloria"
  FactoryGirl.create(:building_owner, name: owner_name)
  prev_count = BuildingUnit.count
  
  visit new_building_unit_path
  fill_in "Street address", :with => " 123 Fake St"
  fill_in "City", :with => "Boston" 
  fill_in "State", :with => "MA"
  fill_in "Postal code", :with => 33242
  fill_in "Description", :with => "It's a 19th century Victorian"
  select owner_name, from: 'Building owner'

  click_on 'Submit'
  # save_and_open_page
  expect(page).to have_content "Building entry was successfully submitted"
  expect(BuildingUnit.count).to eql(prev_count + 1)
end

scenario "user submits invalid information" do
  prev_count = BuildingUnit.count
  visit new_building_unit_path
  fill_in "Street address", :with => " 123 Fake St."
  fill_in "City", :with => "Boston" 
  fill_in "Description", :with => "It's a 19th century Victorian"

  click_on 'Submit'
  expect(page).to_not have_content "Building entry was successfully submitted"
  expect(page).to have_content "Enter the required fields and resubmit"
  expect(BuildingUnit.count).to eql(prev_count)
end
  
end
