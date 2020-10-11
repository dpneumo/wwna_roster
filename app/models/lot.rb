class Lot < ApplicationRecord
  belongs_to :address
  has_one :house

  validates :address_id, presence: true
end
