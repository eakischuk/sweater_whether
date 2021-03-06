class GeocodingClient
  def self.get_lat_lon(location)
    Rails.cache.fetch("#{location.downcase}-lat-lng") do
      response  = conn.get('/geocoding/v1/address', {location: location})
      parse_json(response)
    end
  end

  private

  def self.conn
    Faraday.new(
      url: 'http://open.mapquestapi.com',
      params: { key: ENV['MAP_QUEST_KEY']}
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
