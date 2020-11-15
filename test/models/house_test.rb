require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @hse = houses(:one)
  end

  test "a valid house succeeds" do
    assert @hse.save
  end

  test "latitude may not be > 90" do
    @hse.latitude = 100
    refute @hse.save, "Saved house with too high latitude"
  end

  test "latitude may not be < -90" do
    @hse.latitude = -100
    refute @hse.save, "Saved house with too low latitude"
  end

  test "longitude may not be > 180" do
    @hse.longitude = 200
    refute @hse.save, "Saved house with too high longitude"
  end

  test "longitude may not be < -180" do
    @hse.longitude = -200
    refute @hse.save, "Saved house with too low longitude"
  end

  test "House.for_select returns options for grouped_options_for_select helper" do
    expected = {"Oak Dr"=>[["123A", 1]], "aaa"=>[["zzz", 2]]}
    assert_equal expected, House.for_select
  end

  test "House.street_names returns the streets of it's houses" do
    streets = House.street_names
    err_msg ="House did not return a complete list of streets"
    assert streets.include?(@hse.street), err_msg
  end

  test "House.statuses returns a list of statuses" do
    statuses = House.statuses
    err_msg ="House did not return a list of statuses"
    assert statuses.include?("Vacant"), err_msg
  end

  test "street_number returns the house address" do
    assert_equal '123A Oak Dr', @hse.street_number
  end

  test "implements <=> for houses based on addresses" do
    h1 = House.new(number: '1', street: 'aaa')
    h2 = House.new(number: '9', street: 'bbb')
    assert h1 < h2    # [  1, aaa ] < [ 9, bbb ]
    h1.number = '99'
    assert h1 < h2    # [ 99, aaa ] < [ 9, bbb ]
    h1.street = 'ccc'
    h1.number = '9'
    assert h1 > h2    # [ 9, ccc ] > [ 9, bbb ]
    h2.street = 'ccc'
    assert h1 = h2    # [ 9, ccc ] = [ 9, ccc ]
  end
end
