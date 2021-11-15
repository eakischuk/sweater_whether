class ImageClient
  def self.background(location)
    params = {
      query: location,
      per_page: 1,
      orientation: 'landscape'
    }
    response = conn.get('/search/photos', params)
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(
      url: 'https://api.unsplash.com',
      params: { client_id: ENV['UNSPLASH_KEY'] }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
