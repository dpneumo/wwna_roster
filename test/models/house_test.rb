require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @hse = houses(:one)
  end
  
  test "a valid house succeeds" do
    assert @hse.save
  end

  test "lot_id must be present" do
    @hse.lot_id = ""
    refute @hse.save, "Saved house without lot_id"
  end
end