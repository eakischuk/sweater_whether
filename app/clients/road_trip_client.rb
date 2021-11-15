class RoadTripClient
  def self.travel_time(from, to)
    response  = conn.get('/directions/v2/route', { from: from, to: to })
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: { key: ENV['MAP_QUEST_KEY']}
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
