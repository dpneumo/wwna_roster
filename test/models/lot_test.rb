require 'test_helper'

class LotTest < ActiveSupport::TestCase
  setup do
    @lot = lots(:one)
  end
  
  test "a valid lot succeeds" do
    assert @lot.save
  end

  test "address_id must be present" do
    @lot.address_id = ""
    refute @lot.save, "Saved lot without address_id"
  end
end
