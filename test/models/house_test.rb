require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @hse = houses(:one)
  end
  
  test "a valid house succeeds" do
    assert @hse.save
  end

  test "address_id must be present" do
    @hse.address_id = ""
    refute @hse.save, "Saved house without address_id"
  end
end
