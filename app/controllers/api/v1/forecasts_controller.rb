class Api::V1::ForecastsController < ApplicationController
  def show
    if params[:location]
      forecast = ForecastFacade.weather_by_location(params[:location])
      render json: ForecastSerializer.new(forecast)
    else
      bad_request
    end
  end
end
