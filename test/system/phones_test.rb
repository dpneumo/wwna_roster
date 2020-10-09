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

    fill_in "", with: @phone.
    fill_in "Area", with: @phone.area
    fill_in "Cc", with: @phone.cc
    fill_in "Number", with: @phone.number
    fill_in "Txt msg", with: @phone.txt_msg
    fill_in "Type", with: @phone.type
    click_on "Create Phone"

    assert_text "Phone was successfully created"
    click_on "Back"
  end

  test "updating a Phone" do
    visit phones_url
    click_on "Edit", match: :first

    fill_in "", with: @phone.
    fill_in "Area", with: @phone.area
    fill_in "Cc", with: @phone.cc
    fill_in "Number", with: @phone.number
    fill_in "Txt msg", with: @phone.txt_msg
    fill_in "Type", with: @phone.type
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
