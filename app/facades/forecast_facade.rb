class ForecastFacade
  def self.weather_by_location(location)
    weather = ForecastService.weather_by_location(location)
    Forecast.new(weather)
  end
end
