# frozen_string_literal: true

require 'test_helper'

class HousePresenterTest < ActiveSupport::TestCase
  test 'statuses returns an array of statuses' do
    house = StubHouse.new
    statuses = HousePresenter.new(house, nil).statuses
    assert_equal Array, statuses.class
    err_msg = 'House did not return a list of statuses'
    assert statuses.include?('Vacant'), err_msg
  end

  test 'returns an array of street names' do
    house1 = StubHouse.new(1, '123', 'A')
    house2 = StubHouse.new(2, '456', 'B')
    House.stub(:all, [house1, house2]) do
      streets = HousePresenter.new(nil, nil).street_names
      assert_equal %w[A B], streets
    end
  end

  test 'select_list returns a list of streets for selection' do
    house1 = StubHouse.new(1, '123', 'A')
    house2 = StubHouse.new(2, '456', 'B')
    House.stub(:all, [house1, house2]) do
      list = HousePresenter.new(nil, nil).select_list
      assert_equal [['123 A', 1], ['456 B', 2]], list
    end
  end

  test 'for_select returns grouped_options_for_select helper' do
    house1 = StubHouse.new(1, '123', 'A')
    house2 = StubHouse.new(2, '456', 'B')
    House.stub(:all, [house1, house2]) do
      list = HousePresenter.new(nil, nil).for_select
      expected = { 'A' => [['123', 1]], 'B' => [['456', 2]] }
      assert_equal expected, list
    end
  end

  test 'returns a formatted address for a house' do
    house = StubHouse.new(1, '123', 'A')
    hp = HousePresenter.new(house, nil)
    assert_equal '123 A', hp.house_address
  end

  test "returns addresses of a house's linked lots" do
    lot1  = StubHouse.new(2, '456', 'B')
    lot2  = StubHouse.new(3, '789', 'B')
    house = StubHouse.new(1, '123', 'A', [lot1, lot2])
    hp = HousePresenter.new(house, nil)
    assert_equal '456 B; 789 B', hp.linked_lot_addresses
  end

  test "returns '' if a house has no linked lots" do
    house = StubHouse1.new(1, '123 A', nil)
    hp = HousePresenter.new(house, nil)
    assert_equal '', hp.linked_lot_addresses
  end

  test 'returns contributions for the house for a given year' do
    house = StubHouse.new(1, '123', 'A')
    contrib = StubContribution.new(1, 59_900)
    hp = HousePresenter.new(house, nil)
    Contributions::GetForHouseAndYear.stub(:call, [contrib]) do
      assert_equal 59_900, hp.contributions(year: 2020)
    end
  end
end
