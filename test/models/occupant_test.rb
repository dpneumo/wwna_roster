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

  test "Occupant.relations returns a list of relationships" do
    assert Occupant.relations.include?('Child')
  end

  test "Occupant.states returns a list of statusus" do
    assert Occupant.states.include?('Owner')
  end
end
