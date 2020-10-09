require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @em = emails(:valid)
  end
  
  test "a valid email succeeds" do
    assert @em.save
  end

  test "address must be present" do
    @em.address = ""
    refute @em.save, "Saved email without address"
  end

  test "note may be nil" do
    @em.note = nil
    assert @em.save, "Save email failed with nil note"
  end

  test "note may be empty" do
    @em.note = ""
    assert @em.save, "Save email failed with empty note"
  end
end
