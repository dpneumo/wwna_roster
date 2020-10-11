class House < ApplicationRecord
  belongs_to :lot
  has_many :occupancies
  has_many :people, through: :occupancies
  has_many :owners
  has_many :people, through: :owners

  validates :lot_id, presence: true
end
