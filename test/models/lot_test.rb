require 'test_helper'

class LotTest < ActiveSupport::TestCase
  setup do
    @lot = lots(:one)
  end
  
  test "a valid lot succeeds" do
    assert @lot.save
  end

  test "latitude may not be > 90" do
    @lot.latitude = 100
    refute @lot.save, "Saved lot with too high latitude"
  end

  test "latitude may not be < -90" do
    @lot.latitude = -100
    refute @lot.save, "Saved lot with too low latitude"
  end

  test "longitude may not be > 180" do
    @lot.longitude = 200
    refute @lot.save, "Saved lot with too high longitude"
  end

  test "longitude may not be < -180" do
    @lot.longitude = -200
    refute @lot.save, "Saved lot with too low longitude"
  end
end
