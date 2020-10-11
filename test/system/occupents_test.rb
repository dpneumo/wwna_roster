require "application_system_test_case"

class OccupanciesTest < ApplicationSystemTestCase
  setup do
    @occupancy = occupancies(:one)
  end

  test "visiting the index" do
    visit occupancies_url
    assert_selector "h1", text: "Occupancies"
  end

  test "creating an Occupancy" do
    visit occupancies_url
    click_on "New Occupancy"

    fill_in "House", with: @occupancy.house_id
    fill_in "Note", with: @occupancy.note
    fill_in "Person", with: @occupancy.person_id
    fill_in "Relation", with: @occupancy.relation
    fill_in "Status", with: @occupancy.status
    click_on "Create Occupancy"

    assert_text "Occupancy was successfully created"
    click_on "Back"
  end

  test "updating an Occupancy" do
    visit occupancies_url
    click_on "Edit", match: :first

    fill_in "House", with: @occupancy.house_id
    fill_in "Note", with: @occupancy.note
    fill_in "Person", with: @occupancy.person_id
    fill_in "Relation", with: @occupancy.relation
    fill_in "Status", with: @occupancy.status
    click_on "Update Occupancy"

    assert_text "Occupancy was successfully updated"
    click_on "Back"
  end

  test "destroying an Occupancy" do
    visit occupancies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Occupancy was successfully destroyed"
  end
end
