require 'test_helper'

class OccupancyTest < ActiveSupport::TestCase
  setup do
    @occ = occupancies(:one)
  end
  
  test "a valid occupancy succeeds" do
    assert @occ.save
  end

  test "house_id must be present" do
    @occ.house_id = ""
    refute @occ.save, "Saved occupancy without house_id"
  end

  test "person_id must be present" do
    @occ.person_id = ""
    refute @occ.save, "Saved occupancy without person_id"
  end
end
