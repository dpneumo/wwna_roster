class House < ApplicationRecord
  validates :lot_id, presence: true
end
