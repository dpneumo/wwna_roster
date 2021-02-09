require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  setup do
    @psn = positions(:one)
  end

  test "Can save a valid position" do
    assert @psn.save, "Failed to save a valid position"
  end

  test "name must be present" do
    @psn.name = ''
    refute @psn.save, "Saved position without name"
  end

  test "start must be present" do
    @psn.start = ''
    refute @psn.save, "Saved position without start"
  end

  test "stop must be present" do
    @psn.stop = ''
    refute @psn.save, "Saved position without stop"
  end

  test "stop must be after start" do
  	@psn.start = Date.today
    @psn.stop = Date.yesterday
    refute @psn.save, "Saved position with stop before start"
    @psn.stop = Date.today
    refute @psn.save, "Saved position with stop = start"
  end

  test "person_name returns a formated, person name" do
  	assert_equal 'Heinlin, Robert A', @psn.person_name
  end

  test "person_name returns 'UnAssigned' if no person assigned" do
  	@psn.person_id = nil
  	assert_equal 'UnAssigned', @psn.person_name
  end
end
