class Person < ApplicationRecord
  validates :first, presence: true
  validates :last,  presence: true
end
