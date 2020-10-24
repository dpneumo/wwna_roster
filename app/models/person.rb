class Person < ApplicationRecord
  has_many :person_addresses
  has_many :addresses, through: :person_addresses
  has_many :emails
  has_many :person_phones
  has_many :phones,    through: :person_phones
  has_one :occupant
  has_one :house, through: :occupants
  has_many :owners
  has_many :houses, through: :owners

  validates :first, presence: true
  validates :last,  presence: true

  def fullname
    last + ', ' + first + ' ' + middle
  end

  def addresses
    person_addresses
  end
end
