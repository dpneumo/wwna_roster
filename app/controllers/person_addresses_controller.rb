class PersonAddressesController < ApplicationController
  before_action :set_person_address, only: [:show, :edit, :update, :destroy]

  # GET /person_addresses
  # GET /person_addresses.json
  def index
    @person_addresses = PersonAddress.all
  end

  # GET /person_addresses/1
  # GET /person_addresses/1.json
  def show
  end

  # GET /person_addresses/new
  def new
    @person_address = PersonAddress.new
  end

  # GET /person_addresses/1/edit
  def edit
  end

  # POST /person_addresses
  # POST /person_addresses.json
  def create
    @person_address = PersonAddress.new(person_address_params)

    respond_to do |format|
      if @person_address.save
        format.html { redirect_to @person_address, notice: 'Person address was successfully created.' }
        format.json { render :show, status: :created, location: @person_address }
      else
        format.html { render :new }
        format.json { render json: @person_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_addresses/1
  # PATCH/PUT /person_addresses/1.json
  def update
    respond_to do |format|
      if @person_address.update(person_address_params)
        format.html { redirect_to @person_address, notice: 'Person address was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_address }
      else
        format.html { render :edit }
        format.json { render json: @person_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_addresses/1
  # DELETE /person_addresses/1.json
  def destroy
    @person_address.destroy
    respond_to do |format|
      format.html { redirect_to person_addresses_url, notice: 'Person address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_address
      @person_address = PersonAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_address_params
      params.require(:person_address).permit(:person_id, :address_id, :locn, :preferred)
    end
end
