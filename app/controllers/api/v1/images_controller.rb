class Api::V1::ImagesController < ApplicationController
  def show
    if params[:location].present?
      background = ImageFacade.background_search(params[:location])
      render json: ImageSerializer.new(background)
    else
      bad_request
    end
  end
end
