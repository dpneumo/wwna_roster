require 'test_helper'

class PersonPresenterTest < ActiveSupport::TestCase
=begin
  test "returns a sortable name" do
  	pers = StubPerson.new('Jones, Sam Richard')
  	pdata = PersonData.new(pers)
    assert_equal 'Jones, Sam Richard', pdata.fullname
  end
=end
  test 'returns a house address if house assigned' do
    house = StubHouse.new('1', '789', 'Jump Street')
    pers = StubPerson.new('1', 'Sam', 'Richard', 'Jones', '123', house)
    presenter = PersonPresenter.new(pers, nil)
    assert_equal '789 Jump Street', presenter.house_address
  end

  test 'returns "" if house not assigned' do
    pers = StubPerson.new('1', 'Sam', 'Richard', 'Jones', '123', nil)
    presenter = PersonPresenter.new(pers, nil)
    assert_equal '', presenter.house_address
  end

  test 'returns a preferred email address when assigned' do
  	em1 = StubEmail.new('1','a@b.c')
  	pers = StubPersonEM.new('1', [ em1 ])
    Person::GetPreferredEmail.stub(:call, em1) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal 'a@b.c', presenter.preferred_email
    end
  end

  test 'preferred_email returns an empty string if person_id is invalid' do
  	pers = StubPersonEM.new('Invalid', [ ])
    Person::GetPreferredEmail.stub(:call, nil) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '', presenter.preferred_email
    end
  end

  test 'returns a preferred phone when assigned' do
  	ph1 = StubPhone.new('1','817','123', '4567')
  	pers = StubPersonPh.new('1', [ ph1 ])
    Person::GetPreferredPhone.stub(:call, ph1) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '(817) 123-4567', presenter.preferred_phone
    end
  end

  test 'preferred_phone returns an empty string if person_id is invalid' do
  	pers = StubPersonPh.new('Invalid', [ ])
    Person::GetPreferredPhone.stub(:call, nil) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '', presenter.preferred_phone
    end
  end

  test 'returns a preferred address when assigned' do
  	ad1 = StubAddress.new('1', '123A', 'Oak Dr', 'Arlington', 'TX',  '76016')
  	pers = StubPersonAd.new('1', [ ad1 ])
    Person::GetPreferredAddress.stub(:call, ad1) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '123A Oak Dr, Arlington, TX 76016', presenter.preferred_address
    end
  end

  test 'preferred_address returns an empty string if person_id is invalid' do
  	pers = StubPersonAd.new('Invalid', [ ])
    Person::GetPreferredAddress.stub(:call, nil) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '', presenter.preferred_address
    end
  end

  test 'returns the current WWNA position held, if assigned' do
    pers = StubPersonPn.new('1')
    posn = StubPosition.new('1', pers, 'President')
    Positions::GetCurrentForPerson.stub(:call, [ posn ]) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal 'President', presenter.current_position
    end
  end

  test 'returns an empty string for current position if unassigned' do
    pers = StubPersonPn.new('1')
    Positions::GetCurrentForPerson.stub(:call, [ ]) do
      presenter = PersonPresenter.new(pers, nil)
      assert_equal '', presenter.current_position
    end
  end

  test "roles returns a list of roles" do
  	pers = StubPerson.new()
    presenter = PersonPresenter.new(pers, nil)
    assert presenter.roles.include?('Child')
  end

  test "statuses returns a list of statuses" do
  	pers = StubPerson.new()
    presenter = PersonPresenter.new(pers, nil)
    assert presenter.statuses.include?('Owner')
  end

  test "addrs returns a list of addresses" do
    a,b,c = StubAddress1.new('1', 'a'), StubAddress1.new('2', 'b'), StubAddress1.new('3', 'c')
    pers = StubPersonAd.new('1', [a,b,c])
    presenter = PersonPresenter.new(pers, nil)
    assert_equal Array, presenter.addrs.class
    assert_equal 'a', presenter.addrs.first.address
  end

  test "email_addrs returns a list of email addresses" do
    a = StubEmail.new('1', 'a')
    b = StubEmail.new('2', 'b')
    c = StubEmail.new('3', 'c')
    pers = StubPersonEM.new('1', [a,b,c])
    presenter = PersonPresenter.new(pers, nil)
    assert_equal Array, presenter.email_addrs.class
    assert_equal 'b', presenter.email_addrs.second.addr
  end

  test "phone_nums returns a list of phone numbers" do
    a = StubPhone.new('1', '1', '2', '3', '1')
    b = StubPhone.new('2', '4', '5', '6', '1')
    c = StubPhone.new('3', '7', '8', '9', '1')
    pers = StubPersonPh.new('1', [a,b,c])
    presenter = PersonPresenter.new(pers, nil)
    assert_equal Array, presenter.phone_nums.class
    assert_equal '(1) 2-3', presenter.phone_nums.first.ph_number
  end

  test "select_list returns a sorted collection (sorted_name & id) for select" do
    per1 = StubPerson1.new(1, 'M', 'M, A B')
    per2 = StubPerson1.new(2, 'G', 'G, R S')
    per3 = StubPerson1.new(3, 'Q', 'Q, X Y')
    presenter = PersonPresenter.new(nil, nil)
    Person.stub(:all, [per1, per2, per3]) do
      expected = [['G, R S', 2], ['M, A B', 1], ['Q, X Y', 3]]
      assert_equal expected, presenter.select_list
    end
  end
end
