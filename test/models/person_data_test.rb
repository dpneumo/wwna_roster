require 'test_helper'
require_relative '../fixtures/files/stubs'

class PersonDataTest < ActiveSupport::TestCase

  test "returns a sortable name" do
  	pers = StubPerson.new('Jones, Sam Richard')
  	pdata = PersonData.new(pers)
    assert_equal 'Jones, Sam Richard', pdata.fullname
  end

  test 'returns a house address if assigned' do
  	house = StubHouse.new('789 Jump Street')
  	pers = StubPerson1.new('Sam', 'Richard', 'Jones', '123', house)
  	pdata = PersonData.new(pers)
    assert_equal '789 Jump Street', pdata.house_address
  end

  test 'returns a preferred email address when assigned' do
  	em1 = StubEmail.new('1','a@b.c')
  	em2 = StubEmail.new('2','x@y.z')
  	pers = StubPersonEM.new('1', [em1, em2])
  	pdata = PersonData.new(pers)
    assert_equal 'a@b.c', pdata.preferred_email
  end

  test 'returns an empty string for preferred email when unassigned' do
  	em1 = StubEmail.new('1','a@b.c')
  	em2 = StubEmail.new('2','x@y.z')
  	pers = StubPersonEM.new(nil,[em1, em2])
  	pdata = PersonData.new(pers)
    assert_equal '', pdata.preferred_email
  end

  test 'returns a preferred phone when assigned' do
  	ph1 = StubPhone.new('1','(817) 123-4567')
  	ph2 = StubPhone.new('2','(214) 987-6543')
  	pers = StubPersonPh.new('1', [ph1, ph2])
  	pdata = PersonData.new(pers)
    assert_equal '(817) 123-4567', pdata.preferred_phone
  end

  test 'returns an empty string for preferred phone when unassigned' do
  	ph1 = StubPhone.new('1','(817) 123-4567')
  	ph2 = StubPhone.new('2','(214) 987-6543')
  	pers = StubPersonPh.new(nil, [ph1, ph2])
  	pdata = PersonData.new(pers)
    assert_equal '', pdata.preferred_phone
  end

  test 'returns a preferred address when assigned' do
  	ad1 = StubAddress1.new('1','123A Oak Dr, Arlington, TX  76016')
  	ad2 = StubAddress1.new('2','789 Main, Fort Worth, TX  78912')
  	pers = StubPersonAd.new('1', [ad1, ad2])
  	pdata = PersonData.new(pers)
    assert_equal '123A Oak Dr, Arlington, TX  76016', pdata.preferred_address
  end

  test 'returns an empty string for preferred address when unassigned' do
  	ad1 = StubAddress1.new('1','123A Oak Dr, Arlington, TX  76016')
  	ad2 = StubAddress1.new('2','789 Main, Fort Worth, TX  78912')
  	pers = StubPersonAd.new(nil, [ad1, ad2])
  	pdata = PersonData.new(pers)
    assert_equal '', pdata.preferred_address
  end

  test 'returns the current WWNA position held, if assigned' do
  	pdata = PersonData.new(people(:one))
    assert_equal 'President', pdata.current_position
  end

  test 'returns an empty string for current position if unassigned' do
    pdata = PersonData.new(people(:three))
    assert_equal '', pdata.current_position
  end

  test "Person.roles returns a list of roles" do
  	pers = StubPerson.new()
  	pdata = PersonData.new(pers)
    assert pdata.roles.include?('Child')
  end

  test "Person.statuses returns a list of statusus" do
  	pers = StubPerson.new()
  	pdata = PersonData.new(pers)
    assert pdata.statuses.include?('Owner')
  end
end