require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @addr = addresses(:valid)
  end
  
  test "a valid @address succeeds" do
  	assert @addr.save
  end

  test "line1 must not be null" do
    @addr.line1 = null
  	assert_raises(NameError) { @addr.save }
  end

  test "line1 must not be empty" do
    @addr.line1 = ""
  	refute @addr.save
  end

  test "line2 may be null" do
    @addr = Address.new(line1: "123 Jump", line2: , city: "Arl", state: "TX", zip: "76016")
  	refute @addr.save
  end

  test "line1 may be empty" do
    @addr = Address.new(line1: "123 Jump", line2: "", city: "Arl", state: "TX", zip: "76016")
  	refute @addr.save
  end

  test "city must not be null" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: , state: "TX", zip: "76016")
  	refute @addr.save
  end

  test "city must not be empty" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: "", state: "TX", zip: "76016")
  	refute @addr.save
  end

  test "state must not be null" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: "Arl", state: , zip: "76016")
  	refute @addr.save
  end

  test "state must not be empty" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: "Arl", state: "", zip: "76016")
  	refute @addr.save
  end

  test "zip must not be null" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: "Arl", state: "TX", zip: )
  	refute @addr.save
  end

  test "zip must not be empty" do
    @addr = Address.new(line1: "123 Jump", line2: "abc", city: "Arl", state: "TX", zip: "")
  	refute @addr.save
  end
end
