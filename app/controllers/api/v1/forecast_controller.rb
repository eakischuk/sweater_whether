class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.weather_by_location(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
