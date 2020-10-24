class Phone < ApplicationRecord
  belongs_to :person

  validates :area, presence: true
  validates :prefix, presence: true
  validates :number, presence: true

  def ph_number
    "(#{area}) #{prefix}-#{number}"
  end
end
