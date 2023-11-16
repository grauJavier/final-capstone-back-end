class PlacesController < ApplicationController
  before_action :find_places, only: %i[create update destroy]

  def index
    places = if params[:city_id].present?
               Place.where(city_id: params[:city_id])
             elsif params[:user_id].present?
               Place.where(user_id: params[:user_id])
             elsif params[:id].present?
               Place.where(id: params[:id])
             else
               Place.all
             end
    render json: places.as_json(include: { city: { only: %i[name] } })
  end

  def show
    place = Place.find_by(id: params[:id])
    render json: place
  end

  def create
    place = @places.new(place_params)
    place.build_detail(details_params)
    if place.save
      render json: place.as_json(include: { city: { only: %i[name] } }), status: :created
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
    if place.destroy
      render json: { message: 'Place deteled successfully!' }, status: :ok, head: :no_content
    else
      render json: place.errors, status: :unprocessable_entity, head: :no_content
    end
  end

  private

  def find_places
    @places = Place.where(user_id: params[:user_id])
  end

  def place_params
    params.require(:place).permit(:city_id, :name, :image_url, :description)
  end

  def details_params
    params.require(:details).permit(:place_type, :bedrooms, :beds, :bathrooms, :property_type, :price)
  end
end
