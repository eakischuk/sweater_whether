class ImageSerializer
  include JSONAPI::Serializer
  attributes :image_urls, :credit
end
