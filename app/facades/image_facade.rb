class ImageFacade
  def self.background_search(location)
    response = ImageService.background(location)
    Image.new(response)
  end
end
