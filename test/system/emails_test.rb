require "application_system_test_case"

class EmailsTest < ApplicationSystemTestCase
  setup do
    @email = emails(:one)
  end

  test "visiting the index" do
    visit emails_url
    assert_selector "h1", text: "Emails"
  end

  test "creating a Email" do
    visit emails_url
    click_on "New Email"

    fill_in "Person", with: @email.person_id
    fill_in "Address", with: @email.addr
    fill_in "Location", with: @email.locn
    fill_in "Preferred", with: @email.preferred
    fill_in "Note", with: @email.note
    click_on "Create Email"

    assert_text "Email was successfully created"
    click_on "Back"
  end

  test "updating a Email" do
    visit emails_url
    click_on "Edit", match: :first

    fill_in "Person", with: @email.person_id
    fill_in "Address", with: @email.addr
    fill_in "Location", with: @email.locn
    fill_in "Preferred", with: @email.preferred
    fill_in "Note", with: @email.note
    click_on "Update Email"

    assert_text "Email was successfully updated"
    click_on "Back"
  end

  test "destroying a Email" do
    visit emails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email was successfully destroyed"
  end
end
