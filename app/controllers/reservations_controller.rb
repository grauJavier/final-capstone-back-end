class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET
  def index
    reservations = Reservation.all
    render json: reservations, status: :ok
  end

  # GET
  def show
    render json: @reservation, status: :ok
  end

  # POST
  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reservation not found' }, status: :not_found
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :place_id, :schedule_date, :city_id)
  end
end
