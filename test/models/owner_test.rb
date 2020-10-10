require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  setup do
    @own = owners(:one)
  end
  
  test "a valid owner succeeds" do
    assert @own.save
  end

  test "house_id must be present" do
    @own.house_id = ""
    refute @own.save, "Saved owner without house_id"
  end

  test "person_id must be present" do
    @own.person_id = ""
    refute @own.save, "Saved owner without person_id"
  end
end
