class ReservationsController < ApplicationController
  before_action :find_reservations, only: %i[index show create update destroy]

  # GET
  def index
    reservations = @reservations.includes(place: :city)

    render json: reservations.as_json(
      include: {
        place: { only: %i[name image_url description],
                 include: { city: { only: :name } } }
      }
    ), status: :ok
  end

  # GET
  def show
    reservation = @reservations.find_by(id: params[:id])
    render json: reservation, status: :ok
  end

  # POST
  def create
    reservation = @reservations.new(reservation_params)

    if reservation.save
      render json: reservation.as_json(
      include: {
        place: { only: %i[name image_url description],
                 include: { city: { only: :name } } }
        }
      ), status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    reservation = @reservations.find(params[:id])
    if reservation.update(reservation_params)
      render json: reservation, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    reservation = @reservations.find(params[:id])
    reservation.destroy
    head :no_content
  end

  private

  # Find all the reservations for a user.
  def find_reservations
    @reservations = Reservation.where(user_id: params[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(:place_id, :schedule_date)
  end
end
