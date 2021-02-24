require "application_system_test_case"

class PositionsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test "create a position, edit it and then delete it" do
    visit positions_url

    # Positions List (index)
    assert_selector "h1", text: "Officers & Committee Chairs"
    click_on "New Position"

    # New (form)
    assert_selector "h1", text: "New Position"
    select "Heinlin, Robert A", from: "position_person_id"
    select "President", from: "position_name"
    select "2021", from: "position_start_1i"
    select "January", from: "position_start_2i"
    select "1", from: "position_start_3i"
    select "2021", from: "position_stop_1i"
    select "December", from: "position_stop_2i"
    select "31", from: "position_stop_3i"
    click_on "Create Position"

    # Show
    assert_selector "h1", text: "Position Detail"
    assert_text "Position was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit Position"
    assert find_by_id('position_person_id').disabled?
    select "Secretary", from: "position_name"
    click_on "Update Position"

    # Show
    assert_text "Position was successfully updated"
    click_on "List"


    # Positions List (index)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_text "Position was successfully destroyed"
  end
end
