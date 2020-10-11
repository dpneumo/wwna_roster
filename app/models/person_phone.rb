class PersonPhone < ApplicationRecord
  belongs_to :person
  belongs_to :phone

  validates :person_id, presence: true
  validates :phone_id,  presence: true
end
