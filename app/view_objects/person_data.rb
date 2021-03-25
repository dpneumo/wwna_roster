class PersonData
  delegate  :fullname, :sortable_name, :informal_name, :formal_name,
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
    return '' unless person.pref_email_id
    em = person.emails.find(id: person.pref_email_id).first
    em ? em.addr : ''
  end

  def preferred_phone
    return '' unless person.pref_phone_id
    ph = person.phones.find(id: person.pref_phone_id).first
    ph ? ph.ph_number : ''
  end

  def preferred_address
    return '' unless person.pref_address_id
    addr = person.addresses.find(id: person.pref_address_id).first
    addr ? addr.address : ''
  end

  def current_position
    p = Position.current_posns_for_person(person_id: person.id).last
    p ? p.name : ''
  end
end