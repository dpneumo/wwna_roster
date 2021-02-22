require "application_system_test_case"

class HousesTest < ApplicationSystemTestCase
  setup do
    @house = houses(:one)
    login_as(users(:one))
  end

  test "visiting the index" do
    visit houses_url
    assert_selector "h1", text: "Houses"
  end

  test "creating a House" do
    visit houses_url
    click_on "New House"

    check "Flag" if @house.flag
    fill_in "Linked lot", with: @house.linked_lot_id
    check "Listed" if @house.listed
    fill_in "Lot", with: @house.lot_id
    fill_in "Note", with: @house.note
    check "Rental" if @house.rental
    fill_in "Status", with: @house.status
    click_on "Create House"

    assert_text "House was successfully created"
    click_on "Back"
  end

  test "updating a House" do
    visit houses_url
    click_on "Edit", match: :first

    check "Flag" if @house.flag
    fill_in "Linked lot", with: @house.linked_lot_id
    check "Listed" if @house.listed
    fill_in "Lot", with: @house.lot_id
    fill_in "Note", with: @house.note
    check "Rental" if @house.rental
    fill_in "Status", with: @house.status
    click_on "Update House"

    assert_text "House was successfully updated"
    click_on "Back"
  end

  test "destroying a House" do
    visit houses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "House was successfully destroyed"
  end
end
