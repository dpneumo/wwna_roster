class Person < ApplicationRecord
  has_many :addresses
  has_many :emails
  has_many :phones
  has_one :occupant
  has_one :house, through: :occupant
  has_many :owners
  has_many :properties, through: :owners

  validates :first, presence: true
  validates :last,  presence: true

  def fullname
    last + ', ' + first + ' ' + middle
  end
end
