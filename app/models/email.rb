class Email < ApplicationRecord
  validates :addr, presence: true
end
