class House < ApplicationRecord
  belongs_to :lot
  has_many :occupancies
  has_many :people, through: :occupancies
  has_many :ownerships
  has_many :people, through: :ownerships

  validates :lot_id, presence: true
end
