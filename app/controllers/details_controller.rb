class DetailsController < ApplicationController
  def index
    details = Detail.includes(:place).find_by(place_id: params[:place_id])
    render json: details.as_json(include: { place: { only: %i[name image_url description] } })
  end
end
