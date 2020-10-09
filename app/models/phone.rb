class Phone < ApplicationRecord
  validates :area, presence: true
  validates :prefix, presence: true
  validates :number, presence: true
end
