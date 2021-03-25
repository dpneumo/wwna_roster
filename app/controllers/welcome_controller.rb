class WelcomeController < ApplicationController
  def home
  	wdata = WelcomeData.new
  	@current_year = wdata.current_year
  	@last_year = wdata.last_year
  	@total_dues_current = wdata.total_dues_current
  	@total_dues_last_year = wdata.total_dues_last_year
  	@positions = wdata.positions
  end
end
