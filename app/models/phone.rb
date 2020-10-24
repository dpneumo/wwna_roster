class Phone < ApplicationRecord
  has_many :person_phones
  has_many :phones, through: :person_phones

  validates :area, presence: true
  validates :prefix, presence: true
  validates :number, presence: true

  def ph_number
    "(#{area}) #{prefix}-#{number}"
  end
end
