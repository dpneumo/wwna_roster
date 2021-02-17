require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  setup do
    @psn = positions(:one)
    @per = people(:one)
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
  	@psn.start = Date.current
    @psn.stop = Date.yesterday
    refute @psn.save, "Saved position with stop before start"
    @psn.stop = Date.current
    refute @psn.save, "Saved position with stop = start"
  end

  test "person_name returns a formated, person name" do
  	assert_equal 'Heinlin, Robert A', @psn.person_name
  end

  test "person_name returns 'UnAssigned' if no person assigned" do
  	@psn.person_id = nil
  	assert_equal 'UnAssigned', @psn.person_name
  end

  test "currently_active? returns true if & only if posn is active today" do
  	@psn_inactive = positions(:four)
  	assert @psn.currently_active?, "An active position is identified as inactive"
  	refute @psn_inactive.currently_active?, "An inactive position is identified as active"
  end

  test "Position.current_posns_for_person rtns positions currently held by person" do
  	posns = Position.current_posns_for_person(person_id: @per.id)
  	assert_equal 2, posns.count
  	posn_names = posns.map {|p| p.name }
  	assert posn_names.include? 'President'
  end

  test "Position.current_active_posns rtns positions currently active" do
  	posns = Position.current_active_posns
  	assert_equal 3, posns.count
  	posn_names = posns.map {|p| p.name }
  	assert posn_names.include? 'Treasurer'
  end

  test "Position.posns_active_in_interval rtns positions active some time during an interval" do
  	istart = Date.current.next_year.beginning_of_quarter
  	istop = Date.current.next_year.end_of_quarter
  	posns = Position.posns_active_in_interval(int_start: istart, int_stop: istop)
  	assert_equal 1, posns.count
  end

end
