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
  	pers = StubPersonEM.new('1', [ em1 ])
    Person::GetPreferredEmail.stub(:call, em1) do
      pdata = PersonData.new(pers)
      assert_equal 'a@b.c', pdata.preferred_email
    end
  end

  test 'preferred_email returns an empty string if person.id is invalid' do
  	pers = StubPersonEM.new('Invalid', [ ])
    Person::GetPreferredEmail.stub(:call, nil) do
      pdata = PersonData.new(pers)
      assert_equal '', pdata.preferred_email
    end
  end

  test 'returns a preferred phone when assigned' do
  	ph1 = StubPhone.new('1','(817) 123-4567')
  	pers = StubPersonPh.new('1', [ ph1 ])
    Person::GetPreferredPhone.stub(:call, ph1) do
    	pdata = PersonData.new(pers)
      assert_equal '(817) 123-4567', pdata.preferred_phone
    end
  end

  test 'preferred_phone returns an empty string if person.id is invalid' do
  	pers = StubPersonPh.new('Invalid', [ ])
    Person::GetPreferredPhone.stub(:call, nil) do
    	pdata = PersonData.new(pers)
      assert_equal '', pdata.preferred_phone
    end
  end

  test 'returns a preferred address when assigned' do
  	ad1 = StubAddress1.new('1','123A Oak Dr, Arlington, TX  76016')
  	pers = StubPersonAd.new('1', [ ad1 ])
    Person::GetPreferredAddress.stub(:call, ad1) do
    	pdata = PersonData.new(pers)
      assert_equal '123A Oak Dr, Arlington, TX  76016', pdata.preferred_address
    end
  end

  test 'preferred_address returns an empty string if person.id is invalid' do
  	pers = StubPersonAd.new('Invalid', [ ])
    Person::GetPreferredAddress.stub(:call, nil) do
    	pdata = PersonData.new(pers)
      assert_equal '', pdata.preferred_address
    end
  end

  test 'returns the current WWNA position held, if assigned' do
    pers = StubPersonPn.new('1')
    posn = StubPosition.new('1', 'President')
    Positions::GetCurrentForPerson.stub(:call, [ posn ]) do
    	pdata = PersonData.new(pers)
      assert_equal 'President', pdata.current_position
    end
  end

  test 'returns an empty string for current position if unassigned' do
    pers = StubPersonPn.new('1')
    Positions::GetCurrentForPerson.stub(:call, [ ]) do
      pdata = PersonData.new(pers)
      assert_equal '', pdata.current_position
    end
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