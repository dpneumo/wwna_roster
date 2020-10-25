class Person < ApplicationRecord
  has_many :addresses
  has_many :emails
  has_many :phones
  has_one :occupant
  has_one :house, through: :occupants
  has_many :owners
  has_many :houses, through: :owners

  validates :first, presence: true
  validates :last,  presence: true

  def fullname
    last + ', ' + first + ' ' + middle
  end
end
