require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:valid)
  end
  
  test "a valid address succeeds" do
  	assert @addr.save
  end

  test "line1 must be present" do
    @addr.line1 = ""
  	refute @addr.save, "Saved address without line1"
  end

  test "line2 may be nil" do
    @addr.line2 = nil
  	assert @addr.save, "Save address failed with nil line2"
  end

  test "line2 may be empty" do
    @addr.line2 = ""
  	assert @addr.save, "Save address failed with nil line2"
  end

  test "city must be present" do
    @addr.city = ""
  	refute @addr.save, "Saved address without city"
  end

  test "state must be present" do
    @addr.state = ""
  	refute @addr.save, "Saved address without state"
  end

  test "zip must be present" do
    @addr.zip = ""
  	refute @addr.save, "Saved address without zip"
  end
end
