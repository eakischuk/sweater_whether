class ImageService
  def self.background(location)
    query = weather_query(location)
    ImageClient.background(query)
  end

  private

  def self.weather_query(location)
    weather = ForecastService.weather_by_location(location)
    "#{weather[:current][:weather].first[:description]} #{location}"
  end
end
