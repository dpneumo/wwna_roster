require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  setup do
    @phone = phones(:one)
  end

  test "visiting the index" do
    visit phones_url
    assert_selector "h1", text: "Phones"
  end

  test "creating a Phone" do
    visit phones_url
    click_on "New Phone"

    fill_in "Person", with: @phone.person_id
    fill_in "CC", with: @phone.cc
    fill_in "Area", with: @phone.area
    fill_in "Prefix", with: @phone.prefix
    fill_in "Number", with: @phone.number
    fill_in "Location", with: @phone.locn
    fill_in "Preferred", with: @phone.preferred
    fill_in "Msg Capable", with: @phone.txt_capable
    fill_in "Note", with: @phone.note
    click_on "Create Phone"

    assert_text "Phone was successfully created"
    click_on "Back"
  end

  test "updating a Phone" do
    visit phones_url
    click_on "Edit", match: :first

    fill_in "CC", with: @phone.cc
    fill_in "Area", with: @phone.area
    fill_in "Prefix", with: @phone.prefix
    fill_in "Number", with: @phone.number
    fill_in "Location", with: @phone.locn
    fill_in "Preferred", with: @phone.preferred
    fill_in "Msg Capable", with: @phone.txt_capable
    fill_in "Note", with: @phone.note
    click_on "Update Phone"

    assert_text "Phone was successfully updated"
    click_on "Back"
  end

  test "destroying a Phone" do
    visit phones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Phone was successfully destroyed"
  end
end
