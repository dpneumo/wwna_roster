class PersonEmail < ApplicationRecord
  belongs_to :person
  belongs_to :email

  validates :person_id, presence: true
  validates :email_id,  presence: true
end
