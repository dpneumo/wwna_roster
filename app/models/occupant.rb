class Occupant < ApplicationRecord
  belongs_to :house
  belongs_to :person

  validates :house_id,  presence: true
  validates :person_id, presence: true

  Relations = %w[ Husband Wife Partner Child Guest Other Unknown ]
  States    = %w[ Owner Renter Other Unknown ]

  def self.relations
    Relations
  end

  def self.states
    States
  end
end
