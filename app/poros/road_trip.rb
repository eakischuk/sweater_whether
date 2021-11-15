class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(trip)
    @start_city = trip[:start_city]
    @end_city = trip[:end_city]
    @travel_time = travel_possible(trip)
    @weather_at_eta = include_weather(trip)
  end

  def travel_possible(travel_details)
    if travel_details[:travel][:messages].empty?
      time = travel_details[:travel][:time]
      time.to_time.strftime("%H hours, %M minutes")
    else
      "impossible"
    end
  end

  def include_weather(travel_details)
    if travel_possible(travel_details) == 'impossible'
      {}
    else
      {
        temperature: travel_details[:weather][:temp],
        conditions: travel_details[:weather][:weather].first[:description]
      }
    end
  end
end
