require 'test_helper'
require_relative '../fixtures/files/stubs'

class PositionDataTest < ActiveSupport::TestCase
  test "currently_active? returns true if posn is active today" do
    sally = StubPerson.new('Sally Ride')
    daterange = DateRange.new(Date.yesterday, Date.tomorrow)
    what = StubPosition.new(sally, 'Treas', daterange)
    pdata = PositionData.new(what)
    assert_equal true, pdata.currently_active?
  end

  test "currently_active? returns false if posn is not active today" do
    sally = StubPerson.new('Sally Ride')
    daterange = DateRange.new(Date.current.days_ago(2), Date.yesterday)
    what = StubPosition.new(sally, 'Pres', daterange)
    pdata = PositionData.new(what)
    assert_equal false, pdata.currently_active?
  end

  test "person_name returns 'UnAssigned' if position does not have a person" do
	 	what = StubPosition.new()
  	pdata = PositionData.new(what)
  	assert_equal'UnAssigned', pdata.person_name
  end

  test "person_name returns the name of the person assigned to a position" do
  	sally = StubPerson.new('Sally Ride')
  	teacher = StubPosition.new(sally)
  	pdata = PositionData.new(teacher)
  	assert_equal'Sally Ride', pdata.person_name
  end

  test "person_pref_phone returns empty string if no person assigned" do
    what = StubPosition.new()
    pdata = PositionData.new(what)
    assert_equal'', pdata.person_pref_phone
  end

  test "person_pref_email returns empty string if no person assigned" do
    what = StubPosition.new()
    pdata = PositionData.new(what)
    assert_equal'', pdata.person_pref_email
  end

  test "person_pref_phone returns the phone number of the person assigned to a position" do
    sally = StubPerson.new('Sally Ride', '817-123-4567', 'a@b.c')
    teacher = StubPosition.new(sally)
    pdata = PositionData.new(teacher)
    assert_equal '817-123-4567', pdata.person_pref_phone
  end

  test "preferred_email returns the email of the person assigned to a position" do
    sally = StubPerson.new('Sally Ride', '817-123-4567', 'a@b.c')
    teacher = StubPosition.new(sally)
    pdata = PositionData.new(teacher)
    assert_equal'a@b.c', pdata.person_pref_email
  end
end