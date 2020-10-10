require 'test_helper'

class PersonAddressTest < ActiveSupport::TestCase
  setup do
    @pa = person_addresses(:valid)
  end
  
  test "a valid person_address succeeds" do
    assert @pa.save
  end

  test "person_id must be present" do
    @pa.person_id = nil
    refute @pa.save, "Saved person_address without person_id"
  end

  test "address_id must be present" do
    @pa.address_id = nil
    refute @pa.save, "Saved person_address without address_id"
  end
end
