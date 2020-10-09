require 'test_helper'

class PersonPhoneTest < ActiveSupport::TestCase
  setup do
    @pp = person_phones(:valid)
  end
  
  test "a valid person_phone succeeds" do
    assert @pp.save
  end

  test "person_id must be present" do
    @pp.person_id = ""
    refute @pp.save, "Saved person_phone without person_id"
  end

  test "phone_id must be present" do
    @pp.phone_id = ""
    refute @pp.save, "Saved person_phone without phone_id"
  end

  test "locn may be nil" do
    @pp.locn = nil
    assert @pp.save, "Save person_phone failed with nil locn"
  end

  test "locn may be empty" do
    @pp.locn = ""
    assert @pp.save, "Save person_phone failed with empty locn"
  end

  test "preferred may be nil" do
    @pp.preferred = nil
    assert @pp.save, "Save person_phone failed with nil preferred"
  end

  test "preferred may be empty" do
    @pp.preferred = ""
    assert @pp.save, "Save person_phone failed with empty preferred"
  end
end
