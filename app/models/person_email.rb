class PersonEmail < ApplicationRecord
  validates :person_id, presence: true
  validates :email_id,  presence: true
end
