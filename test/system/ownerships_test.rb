# frozen_string_literal: true

require 'application_system_test_case'

class OwnershipsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test 'create an ownership, edit it then delete it' do
    visit ownerships_url

    # Ownerships List (index)
    assert_selector 'h1', text: 'Ownerships'
    click_on 'New Ownership'

    # New (form)
    assert_selector 'h1', text: 'New Ownership'
    select '123A Oak Dr', from: 'ownership_house_id'
    select 'Satre, Michael B', from: 'ownership_person_id'
    click_on 'Create Ownership'

    # Show
    assert_selector 'h1', text: 'Ownership Detail'
    assert_text 'Ownership was successfully created'
    click_on 'Edit'

    # Edit (form)
    assert_selector 'h1', text: 'Edit Ownership'
    assert find_by_id('ownership_house_id').disabled?
    select 'Heinlin, Robert A', from: 'ownership_person_id'
    click_on 'Update Ownership'

    # Show
    assert_text 'Ownership was successfully updated'
    click_on 'List'

    # Ownerships List (index)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end
    assert_text 'Ownership was successfully destroyed'
  end
end
