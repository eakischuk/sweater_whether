class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :image_urls, :credit
end
