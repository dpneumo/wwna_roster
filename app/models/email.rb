class Email < ApplicationRecord
  has_many :person_emails
  has_many :people, through: :person_emails

  validates :addr, presence: true
end
