require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test "create a phone, edit it and then delete it" do
    # Phones List (index)
    visit phones_url
    assert_selector "h1", text: "Phones"
    click_on "New Phone"

    # New (form)
    assert_selector "h1", text: "New Phone"
    select "Heinlin, Robert A", from: "phone_person_id"
    select "Other", from: 'phone_locn'
    select "Yes", from: 'phone_txt_capable'
    select "No", from: 'phone_preferred'
    fill_in "phone_cc", with: '0'
    fill_in "phone_area", with: '123'
    fill_in "phone_prefix", with: '456'
    fill_in "phone_number", with: '7890'
    fill_in "phone_note", with: 'abc'
    click_on "Create Phone"

    # Show
    assert_selector "h1", text: "Phone Details"
    assert_text "Phone was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit Phone"
    assert find_by_id('phone_person_id').disabled?
    select "Home", from: 'phone_locn'
    select "Yes", from: 'phone_preferred'
    select "No", from: 'phone_txt_capable'
    fill_in "phone_cc", with: '1'
    fill_in "phone_area", with: '890'
    fill_in "phone_prefix", with: '678'
    fill_in "phone_number", with: '2345'
    fill_in "phone_note", with: 'asdfljk'
    click_on "Update Phone"

    # Show
    assert_selector "h1", text: "Phone Details"
    assert_text "Phone was successfully updated"
    click_on "Person Detail"

    # Personal Detail (detail)
    assert_selector "h1", text: "Person Details"
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    
    # Phones List (index)
    assert_selector "h1", text: "Phones"
    assert_text "Phone was successfully destroyed"
  end
end
