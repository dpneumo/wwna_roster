class Contribution < ApplicationRecord
  belongs_to :house

  validates :house_id,  presence: true
  validates :date_paid, presence: true
  validates :amount,    numericality: true
end
