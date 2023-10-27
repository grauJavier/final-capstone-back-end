class CitiesController < ApplicationController
  before_action :find_reservation, only: [:show]

  def index
      cities = City.all
      render json: cities
  end

  def show
      city = City.find(@reservation.city_id)
      render json: city
  end

  private

  def find_reservation
      @reservation = Reservation.find(params[:reservation_id])
  end
end
