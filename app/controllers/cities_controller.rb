class CitiesController < ApplicationController
  before_action :find_place, only: [:show]

  def index
    cities = City.all
    render json: cities
  end

  def show
    city = City.find_by(id: @place.city_id)
    render json: city
  end

  private

  def find_place
    @place = Place.where(user_id: params[:user_id]).find_by(id: params[:place_id])
  end
end
