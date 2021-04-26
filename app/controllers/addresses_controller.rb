class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @pagy, addrs = pagy(Address.all)
    @addresses = addrs.map {|a| AddressData.new(a) }
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @address_data = AddressData.new(@address)
  end

  # GET /addresses/new
  def new
    @address = Address.new
    @address.person_id = params[:person_id]
    @address_data = AddressData.new(@address)
  end

  # GET /addresses/1/edit
  def edit
    @address_data = AddressData.new(@address)
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      Person::MakePrefUnique.call(@address) if @address.preferred
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      Person::MakePrefUnique.call(@address) if @address.preferred
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:person_id,
                                      :number, :street, :city, :state, :zip,
                                      :address_type, :preferred, :note)
    end
end
