class Owner < ApplicationRecord
  belongs_to :house
  belongs_to :person

  validates :house_id,  presence: true
  validates :person_id, presence: true
end
