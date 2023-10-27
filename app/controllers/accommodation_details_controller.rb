class AccommodationDetailsController < ApplicationController
  def index
    accommodation_details = AccommodationDetail.find_by(accommodation_id: params[:accommodation_id])
    render json: accommodation_details
  end
end
