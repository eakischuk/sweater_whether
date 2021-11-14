class OpenWeatherClient
  def self.forecast(lat, lng)
    params = {
      lat: lat,
      lon: lng,
      exclude: 'minutely,alerts',
      units: 'imperial'
    }
    response = conn.get('/data/2.5/onecall', params)
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(
      url: 'https://api.openweathermap.org',
      params: { appid: ENV['OPEN_WEATHER_KEY'] }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
