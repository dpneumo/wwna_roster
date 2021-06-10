# frozen_string_literal: true

require 'application_system_test_case'

class PhonesTest < ApplicationSystemTestCase
  setup do
    login_as(users(:one))
  end

  test 'create a phone, edit it and then delete it' do
    visit phones_url

    # Phones List (index)
    assert_selector 'h1', text: 'Phones'
    click_on 'New Phone'

    # New (form)
    assert_selector 'h1', text: 'New Phone'
    select 'Heinlin, Robert A', from: 'phone_person_id'
    select 'Other', from: 'phone_phone_type'
    select 'Yes', from: 'phone_txt_capable'
    select 'No', from: 'phone_preferred'
    fill_in 'phone_cc', with: '0'
    fill_in 'phone_area', with: '123'
    fill_in 'phone_prefix', with: '456'
    fill_in 'phone_number', with: '7890'
    fill_in 'phone_note', with: 'abc'
    click_on 'Create Phone'

    # Show
    assert_selector 'h1', text: 'Phone Detail'
    assert_text 'Phone was successfully created'
    click_on 'Edit'

    # Edit (form)
    assert_selector 'h1', text: 'Edit Phone'
    assert find_by_id('phone_person_id').disabled?
    select 'Yes', from: 'phone_preferred'
    click_on 'Update Phone'

    # Show
    assert_text 'Phone was successfully updated'
    click_on 'Person Detail'

    # Personal Detail (detail)
    within_table('phones') do
      page.accept_confirm do
        click_on 'Destroy', match: :first
      end
    end

    # Phones List (index)
    assert_text 'Phone was successfully destroyed'
  end
end
