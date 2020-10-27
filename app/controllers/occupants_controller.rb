class OccupantsController < ApplicationController
  before_action :set_occupant, only: [:show, :edit, :update, :destroy]

  # GET /occupants
  # GET /occupants.json
  def index
    @pagy, @occupants = pagy(Occupant.all)
  end

  # GET /occupants/1
  # GET /occupants/1.json
  def show
  end

  # GET /occupants/new
  def new
    @occupant = Occupant.new
    @occupant.house_id = params[:house_id]
  end

  # GET /occupants/1/edit
  def edit
  end

  # POST /occupants
  # POST /occupants.json
  def create
    @occupant = Occupant.new(occupant_params)

    respond_to do |format|
      if @occupant.save
        format.html { redirect_to @occupant, notice: 'Occupant was successfully created.' }
        format.json { render :show, status: :created, location: @occupant }
      else
        format.html { render :new }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occupants/1
  # PATCH/PUT /occupants/1.json
  def update
    respond_to do |format|
      if @occupant.update(occupant_params)
        format.html { redirect_to @occupant, notice: 'Occupant was successfully updated.' }
        format.json { render :show, status: :ok, location: @occupant }
      else
        format.html { render :edit }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupants/1
  # DELETE /occupants/1.json
  def destroy
    @occupant.destroy
    respond_to do |format|
      format.html { redirect_to occupants_url, notice: 'Occupant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupant
      @occupant = Occupant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occupant_params
      params.require(:occupant).permit(:house_id, :person_id, :relation, :status, :note)
    end
end
