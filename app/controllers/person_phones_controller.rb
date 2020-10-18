class PersonPhonesController < ApplicationController
  before_action :set_person_phone, only: [:show, :edit, :update, :destroy]

  # GET /person_phones
  # GET /person_phones.json
  def index
    @pagy, @person_phones = pagy(PersonPhone.all)
  end

  # GET /person_phones/1
  # GET /person_phones/1.json
  def show
  end

  # GET /person_phones/new
  def new
    @person_phone = PersonPhone.new
  end

  # GET /person_phones/1/edit
  def edit
  end

  # POST /person_phones
  # POST /person_phones.json
  def create
    @person_phone = PersonPhone.new(person_phone_params)

    respond_to do |format|
      if @person_phone.save
        format.html { redirect_to @person_phone, notice: 'Person phone was successfully created.' }
        format.json { render :show, status: :created, location: @person_phone }
      else
        format.html { render :new }
        format.json { render json: @person_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_phones/1
  # PATCH/PUT /person_phones/1.json
  def update
    respond_to do |format|
      if @person_phone.update(person_phone_params)
        format.html { redirect_to @person_phone, notice: 'Person phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_phone }
      else
        format.html { render :edit }
        format.json { render json: @person_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_phones/1
  # DELETE /person_phones/1.json
  def destroy
    @person_phone.destroy
    respond_to do |format|
      format.html { redirect_to person_phones_url, notice: 'Person phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_phone
      @person_phone = PersonPhone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_phone_params
      params.require(:person_phone).permit(:person_id, :phone_id, :locn, :preferred)
    end
end
