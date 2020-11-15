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

  def fullname
    last + ', ' + first + ' ' + middle
  end
end
