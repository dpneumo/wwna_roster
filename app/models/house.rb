class House < ApplicationRecord
  include Comparable

  belongs_to :lot
  has_many :occupants
  has_many :people, through: :occupants
  has_many :owners
  has_many :people, through: :owners
  has_many :contributions

  validates :lot_id, presence: true

  def street_number
    lot.street_number
  end

  def <=>(other)
    return -1 if self.lot.street < other.lot.street
    return +1 if self.lot.street > other.lot.street
    self.lot.number <=> other.lot.number
  end
end


