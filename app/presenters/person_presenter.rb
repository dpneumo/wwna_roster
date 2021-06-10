class PersonPresenter < ApplicationPresenter
  def select_list
    Person.all
          .collect {|person| [person.sortable_name, person.id] }
          .sort_by {|element| element.first }
  end

  def roles
    Enums.person_roles
  end

  def statuses
    Enums.person_statuses
  end

  def house_address
    return '' unless house
    HousePresenter.new(house, view_context).house_address
  end

  def current_position
    p = Positions::GetCurrentForPerson.call(person_id).last
    p ? p.name : ''
  end

  def preferred_email
    em = Person::GetPreferredEmail.call(person_id)
    em ? EmailPresenter.new(em, view_context).addr : ''
  end

  def preferred_phone
    ph = Person::GetPreferredPhone.call(person_id)
    ph ? PhonePresenter.new(ph, view_context).ph_number : ''
  end

  def preferred_address
    ad = Person::GetPreferredAddress.call(person_id)
    ad ? AddressPresenter.new(ad, view_context).complete_address : ''
  end

  def addrs
    addresses.map {|addr| AddressPresenter.new(addr, view_context) }
  end

  def email_addrs
    emails.map {|email| EmailPresenter.new(email, view_context) }
  end

  def phone_nums
    phones.map {|ph| PhonePresenter.new(ph, view_context) }
  end

  def houses
    House.all.map do |house|
      hs = HousePresenter.new(house, view_context)
      [hs.house_address, house.id]
    end
  end

  def person_id
    id
  end
end
