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

  test "returns a sortable fullname" do
    assert_equal 'Heinlin, Robert A', @per.fullname
  end

  test "accesses owned houses through properties association" do
    assert_equal 'Oak Dr', @per.properties.first.street
  end

  test "Person.roles returns a list of roles" do
    assert Person.roles.include?('Child')
  end

  test "Person.statuses returns a list of statusus" do
    assert Person.statuses.include?('Owner')
  end

  test "Person.select_list returns collection (id & fullname) for select" do
    list = Person.select_list
    assert_equal 2, list.count
    assert list.first.first.is_a? Integer
    assert_equal "Satre, Michael B", list.last.last
  end
end
