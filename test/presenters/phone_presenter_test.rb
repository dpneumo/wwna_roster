# frozen_string_literal: true

require 'test_helper'

class PhonePresenterTest < ActiveSupport::TestCase
  test 'types returns an array' do
    phone = StubPhone.new
    types = PhonePresenter.new(phone, nil).types
    assert_equal Array, types.class
  end

  test 'persons_list returns an array' do
    phone = StubPhone.new
    persons = PhonePresenter.new(phone, nil).persons_list
    assert_equal Array, persons.class
  end

  test 'ph_number returns a formatted phone number' do
    phone = StubPhone.new('1', '987', '345', '6789')
    presenter = PhonePresenter.new(phone, nil)
    assert_equal '(987) 345-6789', presenter.ph_number
  end

  test "person_name returns 'Unknown' if phone does not have a person" do
    phone = StubPhone.new
    presenter = PhonePresenter.new(phone, nil)
    assert_equal 'Unknown', presenter.person_name
  end

  test 'person_name returns the name of the person assigned to an phone' do
    sally = StubPerson1.new('1', 'Sally Ride')
    phone = StubPhone.new('1', '987', '345', '6789', sally)
    presenter = PhonePresenter.new(phone, nil)
    assert_equal 'Sally Ride', presenter.person_name
  end
end
