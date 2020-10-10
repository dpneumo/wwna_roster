require 'test_helper'

class OccupantTest < ActiveSupport::TestCase
  setup do
    @occ = occupants(:one)
  end
  
  test "a valid occupant succeeds" do
    assert @occ.save
  end

  test "house_id must be present" do
    @occ.house_id = ""
    refute @occ.save, "Saved occupant without house_id"
  end

  test "person_id must be present" do
    @occ.person_id = ""
    refute @occ.save, "Saved occupant without person_id"
  end
end
