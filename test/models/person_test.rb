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

  test "accesses owned houses through properties association" do
    assert_equal 'Oak Dr', @per.properties.first.street
  end

  test "Person.select_list returns collection (id & fullname) for select" do
    list = Person.select_list
    assert_equal 3, list.count
    assert list.first.last.is_a? String
    names = list.map {|item| item.first }
    assert names.include?("Geoffry K Swarch"), "select_list is incomplete"
  end
end
