require 'test_helper'
require_relative '../fixtures/files/stubs'

class AddressDataTest < ActiveSupport::TestCase
	test "types returns a list of address types" do
		addr = StubAddress.new()
		adata = AddressData.new(addr)
		assert adata.types.include? 'Work'
	end

	test "complete_address returns a complete address" do
		addr = StubAddress.new('123', 'Oak', 'Arlington', 'TX', '76123')
		adata = AddressData.new(addr)
		assert_equal '123 Oak, Arlington, TX 76123', adata.complete_address
	end

  test "addressee returns 'Unknown' if address does not have a person" do
	 	addr = StubAddress.new()
  	adata = AddressData.new(addr)
  	assert_equal'Unknown', adata.addressee
  end

  test "addressee returns the name of the person assigned to an address" do
  	sally = StubPerson.new('Sally Ride')
  	addr = StubAddress.new('123', 'Oak', 'Arlington', 'TX', '76123', sally)
  	adata = AddressData.new(addr)
  	assert_equal'Sally Ride', adata.addressee
  end

  test "persons_list returns a list of people for a select control" do
  	addr = StubAddress.new()
  	plist = AddressData.new(addr).persons_list
  	assert_equal Array, plist.class
  	assert_equal Array, plist.first.class
  	assert_equal String, plist.first.first.class
  	assert_equal String, plist.first.last.class
  end

end