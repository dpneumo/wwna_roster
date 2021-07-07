# frozen_string_literal: true

require 'application_system_test_case'

class EmailsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test 'create an email, edit it and then delete it' do
    visit emails_url

    # Emails List (index)
    assert_selector 'h1', text: 'Emails'
    click_on 'New Email'

    # New (form)
    assert_selector 'h1', text: 'New Email'
    select 'Heinlin, Robert A', from: 'email_person_id'
    select 'Other', from: 'email_email_type'
    select 'No', from: 'email_preferred'
    fill_in 'email_addr', with: 'r@s.t'
    fill_in 'email_note', with: 'abc'
    click_on 'Create Email'

    # Show
    assert_selector 'h1', text: 'Email Detail'
    assert_text 'Email was successfully created'
    click_on 'Edit'

    # Edit (form)
    assert_selector 'h1', text: 'Edit Email'
    assert find_by_id('email_person_id').disabled?
    select 'Yes', from: 'email_preferred'
    click_on 'Update Email'

    # Show
    assert_text 'Email was successfully updated'
    click_on 'Person Detail'

    # Personal Detail (detail)
    assert_selector 'h1'
    within_table('emails') do
      page.accept_confirm do
        click_on 'Destroy', match: :first
      end
    end

    # Emails List (index)
    assert_text 'Email was successfully destroyed'
  end
end
