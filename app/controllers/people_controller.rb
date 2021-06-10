# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show detail edit update destroy]

  # GET /people
  def index
    @q = Person.order(last: :asc, first: :asc, middle: :asc)
               .ransack(params[:q])
    @pagy, @people = pagy(@q.result)
  end

  # GET /people/non_occupants
  def non_occupants
    @q = Person.where(house_id: nil)
               .order(last: :asc, first: :asc, middle: :asc)
               .ransack(params[:q])
    @pagy, @people = pagy(@q.result)
    render :index
  end

  # GET /people/1
  def show; end

  # GET /people/1/detail
  def detail; end

  # GET /people/new
  def new
    @person = Person.new
    @disable_house_select = false
  end

  # GET /people/occupant/<house_id>
  def new_occupant
    @person = Person.new
    @person.house_id = params[:house_id]
    @disable_house_select = true
  end

  # GET /people/1/edit
  def edit
    @disable_house_select = false
  end

  # POST /people
  def create
    @person = Person.create(person_params)
    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:nickname, :first, :middle, :last, :suffix, :honorific,
                                   :note, :house_id, :role, :status)
  end
end
