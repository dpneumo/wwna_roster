class HousesController < ApplicationController
  before_action :set_house, only: [:show, :detail, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @q = House.ransack(params[:q])
    @pagy, @houses = pagy(@q.result)
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/1/detail
  def detail
    @occupants = @house.occupants
    @contributions = @house.contributions
  end

  # GET /houses/new
  def new
    @house = House.new
    @statuses = House.statuses
  end

  # GET /houses/1/edit
  def edit
    @statuses = House.statuses
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit( :number, :street, :lat, :lng, :image_link,
                                     :flag, :rental, :listed, :status, :note, lot_ids: [] )
    end
end
