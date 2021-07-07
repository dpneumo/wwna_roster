# frozen_string_literal: true

require 'application_system_test_case'

class OccupantsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test 'create an occupant' do
    visit houses_url

    # Houses List (index)
    assert_selector 'h1', text: 'Houses'
    click_on 'Detail', match: :first

    # House (detail)
    assert_selector 'h1'
    click_on 'New Person as Occupant'

    # New (form)
    assert_selector 'h1', text: 'New Occupant'
    assert find_by_id('person_house_id').disabled?
    select 'Husband', from: 'person_role'
    select 'Renter', from: 'person_status'
    fill_in 'person_honorific', with: 'Sir'
    fill_in 'person_first', with: 'Bob'
    fill_in 'person_middle', with: 'Albert'
    fill_in 'person_last', with: 'Smith'
    fill_in 'person_nickname', with: 'George'
    fill_in 'person_suffix', with: 'Sr.'
    fill_in 'person_note', with: 'abc'
    click_on 'Create Person'

    # Show
    assert_selector 'h1', text: 'Person'
    assert_text 'Person was successfully created'
  end

  test 'add an Occupant' do
    visit houses_url

    # Houses List (index)
    assert_selector 'h1', text: 'Houses'
    click_on 'Detail', match: :first

    # House (detail)
    assert_selector 'h1'
    click_on 'Add Occupant'

    # People List (index)
    assert_selector 'h1', text: 'People'
    within_table('people') do
      click_on 'Edit', match: :first
    end

    # Edit (form)
    assert_selector 'h1', text: 'Edit Person'
    select '123A Oak Dr', from: 'person_house_id'
    click_on 'Update Person'

    # Show
    assert_selector 'h1', text: 'Person'
    assert_text 'Person was successfully updated'
  end
end
