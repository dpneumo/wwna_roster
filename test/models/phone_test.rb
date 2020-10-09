require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  setup do
    @ph = phones(:valid)
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

  test "cc may be nil" do
    @ph.cc = nil
    assert @ph.save, "Save phone failed with nil cc"
  end

  test "cc may be empty" do
    @ph.cc = ""
    assert @ph.save, "Save phone failed with empty cc"
  end

  test "txt_msg may be nil" do
    @ph.txt_msg = nil
    assert @ph.save, "Save phone failed with nil txt_msg"
  end

  test "txt_msg may be empty" do
    @ph.txt_msg = ""
    assert @ph.save, "Save phone failed with empty txt_msg"
  end
end
