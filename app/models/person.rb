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

  Roles  = %w[ Husband Wife Partner Child Guest Other Unknown ]
  Statuses = %w[ Owner Renter Other Unknown ]

  def self.roles
    Roles
  end

  def self.statuses
    Statuses
  end

  def self.select_list
    all.map {|person| [person.fullname, person.id] }
  end

  def fullname
    last + ', ' + first + ' ' + middle
  end

  def house_address
    house_id ? house.house_address : ''
  end

  def preferred_email
    return '' unless pref_email_id
    emails.where(id: pref_email_id).first.addr
  end

  def preferred_phone
    return '' unless pref_phone_id
    phones.where(id: pref_phone_id).first.ph_number
  end

  def preferred_address
    return '' unless pref_address_id
    addresses.where(id: pref_address_id).first.address
  end

  def current_position
    today = Date.today
    p = Position.for(person_id: id, start: today, stop: today).first
    p ? p.name : ''
  end

  def positions_during(start:, stop:)
    positions.where("start <= ? AND stop > ?", start, stop)
  end
end
