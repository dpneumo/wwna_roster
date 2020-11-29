require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  setup do
    @ph = phones(:one)
    @ph2 = phones(:two)
  end

  test "Can save a valid phone" do
    assert @ph.save, "Failed to save a valid phone"
  end

  test "area must be present" do
    @ph.area = ""
    refute @ph.save, "Saved phone without area"
  end

  test "prefix must be present" do
    @ph.prefix = ""
    refute @ph.save, "Saved phone without prefix"
  end

  test "number must be present" do
    @ph.number = ""
    refute @ph.save, "Saved phone without number"
  end

  test "cc defaults to 1" do
    assert_equal "1", @ph2.cc
  end

  test "preferred defaults to false" do
    assert_equal false, @ph2.preferred
  end

  test "txt_capable defaults to false" do
    assert_equal false, @ph2.txt_capable
  end

  test "note may be nil" do
    assert @ph2.save, "Save phone failed with nil note"
  end

  test "note may be empty" do
    @ph.note = ""
    assert @ph.save, "Save phone failed with empty note"
  end
end
