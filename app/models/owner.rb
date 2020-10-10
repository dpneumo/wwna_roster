class Owner < ApplicationRecord
  validates :house_id,  presence: true
  validates :person_id, presence: true
end
