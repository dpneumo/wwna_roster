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

  test 'returns a preferred email when assigned' do
    assert_equal 'aaa@bbb.ccc', @per.preferred_email
  end

  test 'returns an empty string for preferred email when unassigned' do
    @per2 = people(:two)
    assert_equal '', @per2.preferred_email
  end

  test 'returns a preferred phone when assigned' do
    assert_equal "(817) 123-4567", @per.preferred_phone
  end

  test 'returns an empty string for preferred phone when unassigned' do
    @per2 = people(:two)
    assert_equal '', @per2.preferred_phone
  end

  test 'returns a preferred address when assigned' do
    assert_equal "123A Oak Dr, Arlington, TX  76016", @per.preferred_address
  end

  test 'returns an empty string for preferred address when unassigned' do
    @per2 = people(:two)
    assert_equal '', @per2.preferred_address
  end

  test 'returns the current WWNA position held, if assigned' do
    assert_equal 'Secretary', @per.current_position
  end

  test 'returns an empty string for current position if unassigned' do
    @per3 = people(:three)
    assert_equal '', @per3.current_position
  end

  test "Person.roles returns a list of roles" do
    assert Person.roles.include?('Child')
  end

  test "Person.statuses returns a list of statusus" do
    assert Person.statuses.include?('Owner')
  end

  test "Person.select_list returns collection (id & fullname) for select" do
    list = Person.select_list
    assert_equal 3, list.count
    assert list.first.last.is_a? Integer
    names = list.map {|item| item.first }
    assert names.include?("Swarch, Geoffry K"), "select_list is incomplete"
  end
end
