class Forecast
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather
  def initialize(weather)
    @id = nil
    @current_weather = current(weather[:current], weather[:timezone_offset])
    @daily_weather = daily(weather[:daily], weather[:timezone_offset])
    @hourly_weather = hourly(weather[:hourly], weather[:timezone_offset])
  end

  def current(data, timezone)
    {
      datetime: convert_time(data[:dt], timezone),
      sunrise: convert_time(data[:sunrise], timezone),
      sunset: convert_time(data[:sunset], timezone),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
    }
  end

  def daily(data, timezone)
    data.take(5).map do |day|
      {
        date: convert_time(day[:dt], timezone),
        sunrise: convert_time(day[:sunrise], timezone),
        sunset: convert_time(day[:sunset], timezone),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def hourly(data, timezone)
    data.take(8).map do |hour|
      {
        time: convert_time(hour[:dt], timezone).strftime("%k:%M"),
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end

  def convert_time(time, timezone)
    Time.at(time, in: timezone)
  end
end
