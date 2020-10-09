class PersonPhone < ApplicationRecord
  validates :person_id, presence: true
  validates :phone_id,  presence: true
end
