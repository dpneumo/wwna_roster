require "application_system_test_case"

class OccupantsTest < ApplicationSystemTestCase
  setup do
    @occupant = occupants(:one)
    login_as(users(:one))
  end

  test "visiting the index" do
    visit occupants_url
    assert_selector "h1", text: "Occupants"
  end

  test "creating an Occupant" do
    visit occupants_url
    click_on "New Occupant"

    fill_in "House", with: @occupant.house_id
    fill_in "Note", with: @occupant.note
    fill_in "Person", with: @occupant.person_id
    fill_in "Relation", with: @occupant.relation
    fill_in "Status", with: @occupant.status
    click_on "Create Occupant"

    assert_text "Occupant was successfully created"
    click_on "Back"
  end

  test "updating an Occupant" do
    visit occupants_url
    click_on "Edit", match: :first

    fill_in "House", with: @occupant.house_id
    fill_in "Note", with: @occupant.note
    fill_in "Person", with: @occupant.person_id
    fill_in "Relation", with: @occupant.relation
    fill_in "Status", with: @occupant.status
    click_on "Update Occupant"

    assert_text "Occupant was successfully updated"
    click_on "Back"
  end

  test "destroying an Occupant" do
    visit occupants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Occupant was successfully destroyed"
  end
end
