class PersonAddress < ApplicationRecord
  belongs_to :person
  belongs_to :address

  validates :person_id,  presence: true
  validates :address_id, presence: true  
end
