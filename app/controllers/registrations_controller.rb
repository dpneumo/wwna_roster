class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to occupancies_path, notice: 'Registration successful!'
    else
      render :new
    end
  end

  private
      # Only allow a list of trusted parameters through.
    def registration_params
      params.require(:registration )
            .permit(:nickname, :first, :middle, :last,
                    :relation, :status, :house_id )
    end

end
