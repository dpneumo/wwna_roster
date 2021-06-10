class Contributions::GetForYear < ApplicationQuery
  def initialize(year)
  	@year = year
  end

  def call
  	Contribution.where(date_paid: year_range(@year))
  end
  
  def year_range(yr)
    "#{yr}-01-01".."#{yr}-12-31"
  end
end