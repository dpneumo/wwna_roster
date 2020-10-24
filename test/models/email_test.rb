require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @em = emails(:one)
  end

  test "a valid email succeeds" do
    assert @em.save
  end

  test "person_id must be present" do
    @em.person_id = nil
    refute @em.save, "Saved email without person_id"
  end

  test "address must be present" do
    @em.addr = ""
    refute @em.save, "Saved email without addr"
  end

  test "preferred defaults to No" do
    @em = emails(:two)
    assert_equal "No", @em.preferred
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
