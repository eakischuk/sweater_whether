class RoadTripService
  def self.road_trip(from, to)
    travel = travel_details(from, to)
    hours = travel[:time].to_time.hour
    weather = weather_on_arrival(to, hours)
    {
      start_city: from,
      end_city: to,
      travel: travel,
      weather: weather
    }
  end

  private

  def self.destination_forecast(destination)
    lat_long = latitude_longitude(destination)
    lat = lat_long[:lat]
    lon = lat_long[:lng]
    ForecastClient.forecast(lat, lon)
  end

  def self.weather_on_arrival(destination, hours)
    forecast = destination_forecast(destination)
    forecast[:hourly][hours - 1]
  end

  def self.travel_details(from, to)
    travel = RoadTripClient.travel_time(from, to)
    {
      time: travel[:route][:formattedTime],
      messages: travel[:info][:messages]
    }
  end

  def self.latitude_longitude(location)
    response = GeocodingClient.get_lat_lon(location)
    response[:results].first[:locations].first[:latLng]
  end
end
