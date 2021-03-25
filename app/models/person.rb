class Person < ApplicationRecord
  has_many :addresses, -> { order(state: :asc, city: :asc, street: :asc, number: :asc) }
  has_many :emails, -> { order(addr: :asc) }
  has_many :phones, -> { order(cc: :asc, area: :asc, prefix: :asc, number: :asc) }
  belongs_to :house, optional: true
  has_many :ownerships
  has_many :properties, through: :ownerships
  has_many :positions

  validates :first, presence: true
  validates :last,  presence: true

  delegate  :fullname, :sortable_name, :informal_name, :formal_name, 
            to: :person_name

  def self.roles
    Enums.person_roles
  end

  def self.statuses
    Enums.person_statuses
  end

  def self.select_list
    all.map {|person| [person.fullname, person.id] }
  end

  def person_name
    PersonName.new(first, middle, last, nickname, suffix, honorific)
  end

  def person_name=(person_name)
    self.nickname  = person_name.nickname
    self.first, self.middle, self.last = person_name.first, person_name.middle, person_name.last
    self.suffix, self.honorific = person_name.suffix, person_name.honorific
  end

  def house_address
    house_id ? house.house_address : ''
  end

  def preferred_email
    return '' unless pref_email_id
    em = emails.where(id: pref_email_id).first
    em ? em.addr : ''
  end

  def preferred_phone
    return '' unless pref_phone_id
    ph = phones.where(id: pref_phone_id).first
    ph ? ph.ph_number : ''
  end

  def preferred_address
    return '' unless pref_address_id
    addr = addresses.where(id: pref_address_id).first
    addr ? addr.address : ''
  end
end
