class ActivityService
  def self.activities_for(destination)
    weather = current_forecast(destination)
    activities = [relaxation_activity, weather_dependent_activity(weather[:temp])]
    {
      destination: destination,
      forecast: {
        temperature: weather[:temp],
        summary: weather[:weather].first[:description]
      },
      activities: activities
    }
  end

  private

  def self.current_forecast(destination)
    lat_long = latitude_longitude(destination)
    lat = lat_long[:lat]
    lon = lat_long[:lng]
    ForecastClient.forecast(lat, lon)[:current]
  end

  def self.latitude_longitude(location)
    response = GeocodingClient.get_lat_lon(location)
    response[:results].first[:locations].first[:latLng]
  end

  def self.relaxation_activity
    ActivityClient.find_activity('relaxation')
  end

  def self.weather_dependent_activity(temp)
    if temp >= 60
      ActivityClient.find_activity('recreational')
    elsif temp >= 50 && temp < 60
      ActivityClient.find_activity('busywork')
    else
      ActivityClient.find_activity('cooking')
    end
  end
end
