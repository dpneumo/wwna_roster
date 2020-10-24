require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:one)
    @addr2 = addresses(:two)
  end

  test "a valid address succeeds" do
  	assert @addr.save
  end

  test "person_id must be present" do
    @addr.person_id = nil
    refute @addr.save, "Saved address without person_id"
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

  test "locn defaults to Home" do
    assert_equal "Home", @addr2.locn
  end

  test "preferred defaults to No" do
    assert_equal "No", @addr2.preferred
  end

  test "note may be nil" do
    assert @addr2.save, "Save address failed with nil note"
  end

  test "note may be empty" do
    @addr.note = ""
    assert @addr.save, "Save address failed with empty note"
  end
end
