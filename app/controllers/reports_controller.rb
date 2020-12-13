class ReportsController < ApplicationController
  def homes
    @pagy, @homes = pagy(House.order(street: :asc, number: :asc).includes(:occupants), items: 10)
  end
end
