class WelcomeData
  def initialize()
  end

  def current_year
  	Date.current.year
  end

  def last_year
  	Date.current.years_ago(1).year
  end

  def total_dues_current
  	Contribution.total_for(year: current_year)
  end

  def total_dues_last_year
  	Contribution.total_for(year: last_year)
  end

  def positions
  	Position.current_active_posns.all.map {|p| PositionData.new(p) }
  end
end