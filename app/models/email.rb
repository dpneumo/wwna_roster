class Email < ApplicationRecord
  belongs_to :person

  validates :addr, presence: true
end
