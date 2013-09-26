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

scenario "user submits valid information" do
  prev_count = BuildingUnit.count
  visit new_building_unit_path
  fill_in "Street address", :with => " 123 Fake St"
  fill_in "City", :with => "Boston" 
  fill_in "State", :with => "MA"
  fill_in "Postal code", :with => 33242
  fill_in "Description", :with => "It's a 19th century Victorian"

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
