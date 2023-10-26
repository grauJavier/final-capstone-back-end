class AccommodationsController < ApplicationController
  def index
    accommodations = Accommodation.all
    render json: accommodations
  end

  def show
    accommodation = Accommodation.find(params[:id])
    render json: accommodation
  end

  def create
    accommodation = Accommodation.new(accommodation_params)
    if accommodation.save
      render json: accommodation, status: :created
    else
      render json: accommodation.errors, status: :unprocessable_entity
    end
  end

  def update
    accommodation = Accommodation.find(params[:id])
    if accommodation.update(accommodation_params)
      render json: accommodation, status: :ok
    else
      render json: accommodation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    accommodation = Accommodation.find(params[:id])
    accommodation.destroy
    head :no_content
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:name, :image_url)
  end
end
