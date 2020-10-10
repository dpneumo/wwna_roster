require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @per = people(:one)
  end
  
  test "a valid person succeeds" do
    assert @per.save
  end

  test "first must be present" do
    @per.first = ""
    refute @per.save, "Saved person without first"
  end

  test "last must be present" do
    @per.last = ""
    refute @per.save, "Saved person without last"
  end
end
