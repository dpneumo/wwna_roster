require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  setup do
    @own = ownerships(:one)
  end

  test "a valid ownership succeeds" do
    assert @own.save
  end

  test "house_id must be present" do
    @own.house_id = ""
    refute @own.save, "Saved ownership without house_id"
  end

  test "person_id must be present" do
    @own.person_id = ""
    refute @own.save, "Saved ownership without person_id"
  end

  test "can return the house address of the property owned" do
    assert_equal '123A Oak Dr', @own.house_address
  end

  test "can return the owner name for a house" do
    assert_equal 'Heinlin, Robert A', @own.owner_name
  end

  test "accesses houses through property association" do
    hse = houses(:one)
    pers = people(:two)
    ownership = Ownership.new(house_id: hse.id, person_id: pers.id)
    assert_equal hse.id, ownership.property.id
  end
end
