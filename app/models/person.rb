class Person < ApplicationRecord
  has_many :addresses
  has_many :emails
  has_many :phones
  belongs_to :house, optional: true
  has_many :ownerships
  has_many :properties, through: :ownerships

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

end
