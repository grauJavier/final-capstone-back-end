class PlacesController < ApplicationController
  before_action :find_places, only: [:create, :update, :destroy]

  def index
    places = Place.all
    render json: places
  end

  def show
    place = Place.find_by(id: params[:id])
    render json: place
  end

  def create
    place = @places.new(place_params)
    details = place.build_detail(details_params)
    if place.save
      render json: place, status: :created
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  def update
    place = @places.find(params[:id])
    if place.update(place_params)
      place.detail.update(details_params) if place.detail.present?
      render json: place, status: :ok
    else
      render json: place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    place = @places.find(params[:id])
    place.destroy
    head :no_content
  end

  private

  def find_places
    @places = Place.where(user_id: params[:user_id])
  end

  def place_params
    params.require(:place).permit(:name, :image_url, :description)
  end

  def details_params
    params.require(:details).permit(:place_type, :bedrooms, :beds, :bathrooms, :property_type, :price)
  end
end
