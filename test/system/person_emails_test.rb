require "application_system_test_case"

class PersonEmailsTest < ApplicationSystemTestCase
  setup do
    @person_email = person_emails(:one)
  end

  test "visiting the index" do
    visit person_emails_url
    assert_selector "h1", text: "Person Emails"
  end

  test "creating a Person email" do
    visit person_emails_url
    click_on "New Person Email"

    fill_in "Locn", with: @person_email.locn
    fill_in "Person", with: @person_email.person_id
    fill_in "Phone", with: @person_email.phone_id
    fill_in "Preferred", with: @person_email.preferred
    click_on "Create Person email"

    assert_text "Person email was successfully created"
    click_on "Back"
  end

  test "updating a Person email" do
    visit person_emails_url
    click_on "Edit", match: :first

    fill_in "Locn", with: @person_email.locn
    fill_in "Person", with: @person_email.person_id
    fill_in "Phone", with: @person_email.phone_id
    fill_in "Preferred", with: @person_email.preferred
    click_on "Update Person email"

    assert_text "Person email was successfully updated"
    click_on "Back"
  end

  test "destroying a Person email" do
    visit person_emails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person email was successfully destroyed"
  end
end
