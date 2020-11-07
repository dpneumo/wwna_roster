class Ownership < ApplicationRecord
  belongs_to :property, class_name: 'House', foreign_key: :house_id
  belongs_to :person

  validates :house_id,  presence: true
  validates :person_id, presence: true
end
