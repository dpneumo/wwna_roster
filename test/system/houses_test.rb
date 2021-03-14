require "application_system_test_case"

class HousesTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test "Create a house, update it then destroy it" do
    visit houses_url

    # Houses List (index)
    assert_selector "h1", text: "Houses"
    click_on "New House"

    # New (form)
    assert_selector "h1", text: "New House"
    check "house_flag"
    check "house_listed"
    check "house_rental"
    select "zzz", from: 'house_lot_ids'
    select "Occupied", from: 'house_status'
    fill_in "house_number", with: '123'
    fill_in "house_street", with: 'EODr'
    fill_in "house_lat", with: '10.00'
    fill_in "house_lng", with: '20.99'
    fill_in "house_image_link", with: 'lnk'
    fill_in "house_note", with: 'abc'
    click_on "Create House"

    # Show
    assert_selector "h1", text: "House"
    assert_text "House was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit House"
    select "Vacant", from: 'house_status'
    click_on "Update House"

    # Show
    assert_text "House was successfully updated"
    click_on "List"

    # Houses List (index)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_text "House was successfully destroyed"
  end
end
