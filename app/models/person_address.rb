class PersonAddress < ApplicationRecord
  validates :person_id,  presence: true
  validates :address_id, presence: true  
end
