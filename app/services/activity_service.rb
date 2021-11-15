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
    ForecastService.weather_by_location(destination)[:current]
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
