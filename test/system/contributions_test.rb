require "application_system_test_case"

class ContributionsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end


  test "create an contribution, edit it and then delete it" do
    visit contributions_url

    # Contributions List (index)
    assert_selector "h1", text: "Contributions"
    click_on "New Contribution"

    # New (form)
    assert_selector "h1", text: "New Contribution"
    select "123A Oak Dr", from: "contribution_house_id"
    select "2021", from: "contribution_date_paid_1i"
    select "January", from: "contribution_date_paid_2i"
    select "1", from: "contribution_date_paid_3i"
    fill_in "contribution_amount", with: '1.23'
    click_on "Create Contribution"

    # Show
    assert_selector "h1", text: "Contribution Detail"
    assert_text "Contribution was successfully created"
    click_on "Edit"

    # Edit (form)
    assert_selector "h1", text: "Edit Contribution"
    assert find_by_id('contribution_house_id').disabled?
    fill_in "contribution_amount", with: '5.67'
    click_on "Update Contribution"

    # Show
    assert_text "Contribution was successfully updated"
    click_on "House Detail"

    # House Detail (detail)
    assert_selector "h1", text: "House Detail"
    within_table('contributions') do
      page.accept_confirm do
        click_on "Destroy", match: :first
      end
    end
    assert_text "Contribution was successfully destroyed"
  end
end
