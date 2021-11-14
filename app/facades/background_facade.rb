class BackgroundFacade
  def self.background_search(location)
    response = BackgroundService.background(location)
    Background.new(response)
  end
end
