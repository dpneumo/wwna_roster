require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:one)
  end
  
  test "a valid address succeeds" do
  	assert @addr.save
  end

  test "number must be present" do
    @addr.number = ""
    refute @addr.save, "Saved address without number"
  end

  test "street must be present" do
    @addr.street = ""
    refute @addr.save, "Saved address without street"
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
