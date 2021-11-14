class ForecastService
  def self.weather_by_location(location)
    lat_long = latitude_longitude(location)
    lat = lat_long[:lat]
    lon = lat_long[:lng]
    OpenWeatherClient.forecast(lat, lon)
  end

  private

  def self.latitude_longitude(location)
    response = MapQuestClient.get_lat_lon(location)
    response[:results].first[:locations].first[:latLng]
  end
end
