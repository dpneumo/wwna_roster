require "application_system_test_case"

class PersonAddressesTest < ApplicationSystemTestCase
  setup do
    @person_address = person_addresses(:one)
  end

  test "visiting the index" do
    visit person_addresses_url
    assert_selector "h1", text: "Person Addresses"
  end

  test "creating a Person address" do
    visit person_addresses_url
    click_on "New Person Address"

    fill_in "Address", with: @person_address.address_id
    fill_in "Locn", with: @person_address.locn
    fill_in "Person", with: @person_address.person_id
    fill_in "Preferred", with: @person_address.preferred
    click_on "Create Person address"

    assert_text "Person address was successfully created"
    click_on "Back"
  end

  test "updating a Person address" do
    visit person_addresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @person_address.address_id
    fill_in "Locn", with: @person_address.locn
    fill_in "Person", with: @person_address.person_id
    fill_in "Preferred", with: @person_address.preferred
    click_on "Update Person address"

    assert_text "Person address was successfully updated"
    click_on "Back"
  end

  test "destroying a Person address" do
    visit person_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person address was successfully destroyed"
  end
end
