class Lot < ApplicationRecord
  validates :address_id, presence: true
end
