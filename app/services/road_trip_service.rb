class RoadTripService
  def self.road_trip(from, to)
    travel = travel_details(from, to)
    hours = travel[:time]&.to_time&.hour
    weather = weather_on_arrival(to, hours)
    {
      start_city: from,
      end_city: to,
      travel: travel,
      weather: weather
    }
  end

  private

  def self.weather_on_arrival(destination, hours)
    forecast = ForecastService.weather_by_location(destination)
    if hours.nil?
    else
      forecast[:hourly][hours - 1]
    end
  end

  def self.travel_details(from, to)
    travel = RoadTripClient.travel_time(from, to)
    {
      time: travel[:route][:formattedTime],
      messages: travel[:info][:messages]
    }
  end
end
