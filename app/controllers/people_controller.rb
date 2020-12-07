class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :detail, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
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
  # GET /people/1.json
  def show
  end

  # GET /people/1/detail
  def detail
  end

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
  # POST /people.json
  def create
    @person = Person.create(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit( :nickname, :first, :middle, :last, :suffix, :honorific,
                                      :note, :house_id, :role, :status )
    end
end
