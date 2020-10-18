class PersonEmailsController < ApplicationController
  before_action :set_person_email, only: [:show, :edit, :update, :destroy]

  # GET /person_emails
  # GET /person_emails.json
  def index
    @pagy, @person_emails = pagy(PersonEmail.all)
  end

  # GET /person_emails/1
  # GET /person_emails/1.json
  def show
  end

  # GET /person_emails/new
  def new
    @person_email = PersonEmail.new
  end

  # GET /person_emails/1/edit
  def edit
  end

  # POST /person_emails
  # POST /person_emails.json
  def create
    @person_email = PersonEmail.new(person_email_params)

    respond_to do |format|
      if @person_email.save
        format.html { redirect_to @person_email, notice: 'Person email was successfully created.' }
        format.json { render :show, status: :created, location: @person_email }
      else
        format.html { render :new }
        format.json { render json: @person_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_emails/1
  # PATCH/PUT /person_emails/1.json
  def update
    respond_to do |format|
      if @person_email.update(person_email_params)
        format.html { redirect_to @person_email, notice: 'Person email was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_email }
      else
        format.html { render :edit }
        format.json { render json: @person_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_emails/1
  # DELETE /person_emails/1.json
  def destroy
    @person_email.destroy
    respond_to do |format|
      format.html { redirect_to person_emails_url, notice: 'Person email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_email
      @person_email = PersonEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_email_params
      params.require(:person_email).permit(:person_id, :email_id, :locn, :preferred)
    end
end
