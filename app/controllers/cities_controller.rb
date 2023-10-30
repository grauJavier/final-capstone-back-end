class CitiesController < ApplicationController
  before_action :find_reservation, only: [:show]

  def index
    cities = City.all
    render json: cities
  end

  def show
    city = City.find_by(id: @reservation.city_id)
    render json: city
  end

  private

  def find_reservation
    @reservation = Reservation.where(user_id: params[:user_id]).find_by(id: params[:reservation_id])
  end
end
