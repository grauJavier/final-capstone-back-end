class DetailsController < ApplicationController
  def index
    details = Detail.includes(:place).find_by(place_id: params[:place_id])
    render json: details.as_json(include: { place: { only: %i[name user_id image_url description],
                                                     include: { city: { only: %i[name id] } } } })
  end
end
