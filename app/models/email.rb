class Email < ApplicationRecord
  belongs_to :person

  validates :person_id, presence: true
  validates :addr, presence: true
end
