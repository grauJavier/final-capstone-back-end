class DetailsController < ApplicationController
  def index
    details = Detail.find_by(place_id: params[:place_id])
    render json: details
  end
end
