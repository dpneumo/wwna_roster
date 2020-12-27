class Contribution < ApplicationRecord
  belongs_to :house

  validates :house_id,  presence: true
  validates :date_paid, presence: true

  monetize :amount_cents, numericality: true


  def self.for(house_id:, year: Date.today.year)
    self.where(house_id: house_id, date_paid: year_range(year)).reduce(0) {|sum,c| sum+c.amount_cents }
  end

  def self.total_for(year: Date.today.year)
    self.where(date_paid: year_range(year)).reduce(0) {|sum,c| sum+c.amount_cents }
  end

  def house_address
    house ? house.house_address : ''
  end

  private
    def self.year_range(yr)
      "#{yr}-01-01".."#{yr}-12-31"
    end
end


