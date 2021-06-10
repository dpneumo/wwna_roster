# frozen_string_literal: true

require 'test_helper'

class OwnershipPresenterTest < ActiveSupport::TestCase
  test 'can return the house address of the property owned' do
    owner    = StubPerson1.new(1, 'A B', 'B, A')
    property = StubAddress.new(1, '67', 'B', 'C', 'TX', '234')
    onrshp   = StubOwnership.new(1, owner, property)
    op = OwnershipPresenter.new(onrshp, nil)
    assert_equal '67 B', op.house_address
  end

  test 'can return the owner_name' do
    owner    = StubPerson1.new(1, 'A B', 'B, A')
    property = StubAddress.new(1, '67', 'B', 'C', 'TX', '234')
    onrshp   = StubOwnership.new(1, owner, property)
    op = OwnershipPresenter.new(onrshp, nil)
    assert_equal 'A B', op.owner_name
  end

  test 'persons_list returns an array' do
    onrshp  = StubOwnership.new(1, nil, nil)
    persons = OwnershipPresenter.new(onrshp, nil).people_list
    assert_equal Array, persons.class
  end

  test 'house_list returns an array' do
    onrshp = StubOwnership.new(1, nil, nil)
    houses = OwnershipPresenter.new(onrshp, nil).house_list
    assert_equal Array, houses.class
  end
end
