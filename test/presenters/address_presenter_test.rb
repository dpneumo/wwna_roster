# frozen_string_literal: true

require 'test_helper'

class AddressPresenterTest < ActiveSupport::TestCase
  test 'types returns an array' do
    addr = StubAddress.new
    types = AddressPresenter.new(addr, nil).types
    assert_equal Array, types.class
  end

  test 'persons_list returns an array' do
    addr = StubAddress.new
    persons = AddressPresenter.new(addr, nil).persons_list
    assert_equal Array, persons.class
  end

  test 'complete_address returns a formatted address' do
    addr = StubAddress.new('1', '123', 'Oak', 'Arlington', 'TX', '76123')
    presenter = AddressPresenter.new(addr, nil)
    assert_equal '123 Oak, Arlington, TX 76123', presenter.complete_address
  end

  test "addressee returns 'Unknown' if address does not have a person" do
    addr = StubAddress.new
    presenter = AddressPresenter.new(addr, nil)
    assert_equal 'Unknown', presenter.addressee
  end

  test 'addressee returns the name of the person assigned to an address' do
    sally = StubPerson1.new('1', 'Sally Ride')
    addr = StubAddress.new('1', '123', 'Oak', 'Arlington', 'TX', '76123', sally)
    presenter = AddressPresenter.new(addr, nil)
    assert_equal 'Sally Ride', presenter.addressee
  end
end
