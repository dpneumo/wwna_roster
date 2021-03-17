require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test "create an address, edit it and then delete it" do
    visit addresses_url

    # Addresses List (index)
    assert_selector "h1", text: "Addresses"
    click_on "New Address"
    
    # New (form)
    assert_selector "h1", text: "New Address"
    select "Heinlin, Robert A", from: "address_person_id"
    select "Other", from: 'address_address_type'
    select "No", from: 'address_preferred'
    fill_in "address_number", with: '123'
    fill_in "address_street", with: 'abc'
    fill_in "address_city", with: 'Arl'
    fill_in "address_state", with: 'TX'
    fill_in "address_zip", with: '67890'
    fill_in "address_note", with: 'abc'
    click_on "Create Address"

    # Show
    assert_selector "h1", text: "Address Detail"
    assert_text "Address was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit Address"
    assert find_by_id('address_person_id').disabled?
    select "No", from: 'address_preferred'
    click_on "Update Address"

    # Show
    assert_text "Address was successfully updated"
    click_on "Person Detail"

    # Personal Detail (detail)
    assert_selector "h1", text: "Person Detail"
    within_table('addresses') do
      page.accept_confirm do
        click_on "Destroy", match: :first
      end
    end

    # Addresses List (index)
    assert_text "Address was successfully destroyed"
  end
end
