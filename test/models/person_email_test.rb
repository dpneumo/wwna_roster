require 'test_helper'

class PersonEmailTest < ActiveSupport::TestCase
  setup do
    @pe = person_emails(:one)
  end
  
  test "a valid person_email succeeds" do
    assert @pe.save
  end

  test "person_id must be present" do
    @pe.person_id = nil
    refute @pe.save, "Saved person_email without person_id"
  end

  test "email_id must be present" do
    @pe.email_id = nil
    refute @pe.save, "Saved person_email without email_id"
  end
end
