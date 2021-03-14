require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @hse1 = houses(:one)
    @hse2 = houses(:two)
  end

  test "a valid house succeeds" do
    assert @hse1.save
  end

  test "latitude may not be > 90" do
    @hse1.lat = 100
    refute @hse1.save, "Saved house with too high latitude"
  end

  test "latitude may not be < -90" do
    @hse1.lat = -100
    refute @hse1.save, "Saved house with too low latitude"
  end

  test "longitude may not be > 180" do
    @hse1.lng = 200
    refute @hse1.save, "Saved house with too high longitude"
  end

  test "longitude may not be < -180" do
    @hse1.lng = -200
    refute @hse1.save, "Saved house with too low longitude"
  end

  test "House.for_select returns options for grouped_options_for_select helper" do
    expected = {"Oak Dr"=>[["123A", @hse1.id]], "aaa"=>[["zzz", @hse2.id]]}
    assert_equal expected, House.for_select
  end

  test "House.select_list returns collection (id & address) for select" do
    expected = [["123A Oak Dr", @hse1.id], ["zzz aaa", @hse2.id]]
    assert_equal expected, House.select_list
  end

  test "House.street_names returns the streets of it's houses" do
    streets = House.street_names
    err_msg ="House did not return a complete list of streets"
    assert streets.include?(@hse1.street), err_msg
  end

  test "House.statuses returns a list of statuses" do
    statuses = House.statuses
    err_msg ="House did not return a list of statuses"
    assert statuses.include?("Vacant"), err_msg
  end

  test "house_address returns the house address" do
    assert_equal '123A Oak Dr', @hse1.house_address
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
