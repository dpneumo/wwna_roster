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
end
