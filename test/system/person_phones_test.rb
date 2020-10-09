require "application_system_test_case"

class PersonPhonesTest < ApplicationSystemTestCase
  setup do
    @person_phone = person_phones(:one)
  end

  test "visiting the index" do
    visit person_phones_url
    assert_selector "h1", text: "Person Phones"
  end

  test "creating a Person phone" do
    visit person_phones_url
    click_on "New Person Phone"

    fill_in "Integer,", with: @person_phone.integer,
    fill_in "Locn", with: @person_phone.locn
    fill_in "Person", with: @person_phone.person_id
    fill_in "Phone", with: @person_phone.phone_id
    fill_in "Preferred", with: @person_phone.preferred
    click_on "Create Person phone"

    assert_text "Person phone was successfully created"
    click_on "Back"
  end

  test "updating a Person phone" do
    visit person_phones_url
    click_on "Edit", match: :first

    fill_in "Integer,", with: @person_phone.integer,
    fill_in "Locn", with: @person_phone.locn
    fill_in "Person", with: @person_phone.person_id
    fill_in "Phone", with: @person_phone.phone_id
    fill_in "Preferred", with: @person_phone.preferred
    click_on "Update Person phone"

    assert_text "Person phone was successfully updated"
    click_on "Back"
  end

  test "destroying a Person phone" do
    visit person_phones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person phone was successfully destroyed"
  end
end
