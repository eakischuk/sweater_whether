class Api::V1::BackgroundController < ApplicationController
  def show
    if params[:location].present?
      background = BackgroundFacade.background_search(params[:location])
      render json: BackgroundSerializer.new(background)
    else
      bad_request
    end
  end
end
