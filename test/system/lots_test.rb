require "application_system_test_case"

class LotsTest < ApplicationSystemTestCase
  setup do
    @lot = lots(:one)
  end

  test "visiting the index" do
    visit lots_url
    assert_selector "h1", text: "Lots"
  end

  test "creating a Lot" do
    visit lots_url
    click_on "New Lot"

    fill_in "Address", with: @lot.address_id
    fill_in "Google maps link", with: @lot.google_maps_link
    fill_in "Image link", with: @lot.image_link
    fill_in "Note", with: @lot.note
    fill_in "Tad", with: @lot.tad_id
    click_on "Create Lot"

    assert_text "Lot was successfully created"
    click_on "Back"
  end

  test "updating a Lot" do
    visit lots_url
    click_on "Edit", match: :first

    fill_in "Address", with: @lot.address_id
    fill_in "Google maps link", with: @lot.google_maps_link
    fill_in "Image link", with: @lot.image_link
    fill_in "Note", with: @lot.note
    fill_in "Tad", with: @lot.tad_id
    click_on "Update Lot"

    assert_text "Lot was successfully updated"
    click_on "Back"
  end

  test "destroying a Lot" do
    visit lots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lot was successfully destroyed"
  end
end
