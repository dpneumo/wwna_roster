# frozen_string_literal: true

class NonOccupantsController < ApplicationController
  def index
    @q = non_occup_query
    @pagy, @non_occupants = pagy(@q.result)
    @house_id = params.dig(:q,:house_id) || params.dig(:house_id)
  end

  def update
    non_occupant = Person.find(params[:id])
    if non_occupant.update(house_id: house_id)
      redirect_to house_detail_path(id: house_id), notice: 'An occupant was added.'
    else
      render :index
    end
  end

  private

  def non_occup_query
    Person
      .where(house_id: nil)
      .order(last: :asc, first: :asc, middle: :asc)
      .ransack(params[:q])
  end

  def house_id
    @house_id ||= params[:house_id].match(SharedRegexp::UUID_FORMAT)[0]
  end
end
