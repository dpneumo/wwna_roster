class Address < ApplicationRecord
  has_many :person_addresses
  has_many :people, through: :person_addresses

  validates :number, presence: true
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :zip,    presence: true
end
