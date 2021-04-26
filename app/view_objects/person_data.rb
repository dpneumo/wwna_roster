class PersonData
  delegate  :id, :fullname, :sortable_name, :informal_name, :formal_name,
  					:nickname, :first, :middle, :last, :suffix, :honorific, 
  					:house_id, :role, :status, :note, :addresses, 
  		      to: :@person

  attr_reader :person
  def initialize(person)
  	@person = person
  end

  def roles
    Enums.person_roles
  end

  def statuses
    Enums.person_statuses
  end

  def house_address
    person.house_id ? person.house.house_address : ''
  end

  def preferred_email
    em = Person::GetPreferredEmail.call(id)
    em ? em.addr : ''
  end

  def preferred_phone
    ph = Person::GetPreferredPhone.call(id)
    ph ? ph.ph_number : ''
  end

  def preferred_address
    addr = Person::GetPreferredAddress.call(id)
    addr ? addr.address : ''
  end

  def current_position
    p = Positions::GetCurrentForPerson.call(id).last
    p ? p.name : ''
  end
end