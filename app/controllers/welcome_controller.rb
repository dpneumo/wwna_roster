class WelcomeController < ApplicationController
  def index
  end

  def home
  	@current_year = Date.current.year
  	@last_year = Date.current.years_ago(1).year
  	@total_dues_current = Contribution.total_for(year: @current_year)
  	@total_dues_last_year = Contribution.total_for(year: @last_year)
  	@positions = Position.current_active_posns
  end
end
