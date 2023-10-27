class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end

  def create
    place = Place.new(place_params)
    if place.save
      render json: place, status: :created
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  def update
    place = Place.find(params[:id])
    if place.update(place_params)
      render json: place, status: :ok
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    head :no_content
  end

  private

  def place_params
    params.require(:place).permit(:name, :image_url)
  end
end
