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

  test "amount must be present" do
    @cntrb.amount = nil
    refute @cntrb.save, "Saved contribution without amount"
  end

  test "clean_amount formats amount to $ representation" do
    @cntrb.amount = "45.67"
    @cntrb.save
    @cntrb.reload
    assert_equal "$45.67", @cntrb.amount
  end

  test "clean_amount rounds to 2 decimal places" do
    @cntrb.amount = "45.6789"
    @cntrb.save
    @cntrb.reload
    assert_equal "$45.68", @cntrb.amount
  end

  test "clean_amount scrubs out all char but 0 - 1 & '.'" do
    @cntrb.amount = "45.67abc89"
    @cntrb.save
    @cntrb.reload
    assert_equal "$45.68", @cntrb.amount
  end

  test "clean_amount returns '$0.00' for invalid numbers" do
    # extra decimal points force '$0.00'
    @cntrb.amount = "45.67..89"
    @cntrb.save
    @cntrb.reload
    assert_equal "$0.00", @cntrb.amount

    @cntrb.amount = "45..6789"
    @cntrb.save
    @cntrb.reload
    assert_equal "$0.00", @cntrb.amount
  end

  test "amount cannot be longer than 10 characters" do
    @cntrb.amount = "12345678901234.56"
    refute @cntrb.valid?, "Validated amount > 10 characters"
  end

end
