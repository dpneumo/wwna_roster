class Person < ApplicationRecord
  has_many :person_addresses
  has_many :addresses, through: :person_addresses
  has_many :person_emails
  has_many :emails,    through: :person_emails
  has_many :person_phones
  has_many :phones,    through: :person_phones
  has_one :occupancy
  has_one :house, through: :occupancies
  has_many :ownerships
  has_many :houses, through: :ownerships

  validates :first, presence: true
  validates :last,  presence: true
end
