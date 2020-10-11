require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  setup do
    @cntrb = contributions(:one)
  end
  
  test "a valid contribution succeeds" do
    assert @cntrb.save
  end

  test "house_id must be present" do
    @cntrb.house_id = nil
    refute @cntrb.save, "Saved contribution without house_id"
  end

  test "date_paid must be present" do
    @cntrb.date_paid = nil
    refute @cntrb.save, "Saved contribution without date_paid"
  end

  test "amount must be numerical" do
    @cntrb.amount = 'a string'
    refute @cntrb.save, "Saved contribution with a string in amount field"
  end
end
