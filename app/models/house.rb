class House < ApplicationRecord
  belongs_to :address
  has_many :occupancies
  has_many :people, through: :occupancies
  has_many :ownerships
  has_many :people, through: :ownerships

  validates :address_id, presence: true
end
