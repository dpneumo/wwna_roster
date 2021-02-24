require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test "create a Person, update it then destroy it" do
    visit people_url

    # People List (index)
    assert_selector "h1", text: "People"
    click_on "New Person"

    # New (form)
    assert_selector "h1", text: "New Person"
    fill_in "person_honorific", with: 'Sir'
    fill_in "person_first", with: 'Bob'
    fill_in "person_middle", with: 'Albert'
    fill_in "person_last", with: 'Smith'
    fill_in "person_nickname", with: 'George'
    fill_in "person_suffix", with: 'Sr.'
    fill_in "person_note", with: 'abc'
    click_on "Create Person"

    # Show
    assert_selector "h1", text: "Person"
    assert_text "Person was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit Person"
    fill_in "Honorific", with: 'Dr.'
    click_on "Update Person"

    # Show
    assert_text "Person was successfully updated"
    click_on "List"

    # People List (index)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_text "Person was successfully destroyed"
  end
end
