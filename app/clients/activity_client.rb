class ActivityClient
  def self.find_activity(type)
    response = conn.get('/api/activity', {type: type})
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: 'http://www.boredapi.com')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
