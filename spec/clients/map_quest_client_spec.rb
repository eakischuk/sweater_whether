require 'rails_helper'

RSpec.describe MapQuestClient do
  describe 'api connection' do
    it 'can get latitude and longitude' do
      response = MapQuestClient.get_lat_lon('Denver, CO')
      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results]).to be_an(Array)
      expect(response[:results].first).to be_a(Hash)
      expect(response[:results].first).to have_key(:locations)
      expect(response[:results].first[:locations]).to be_an(Array)
      expect(response[:results].first[:locations].first).to be_a(Hash)
      expect(response[:results].first[:locations].first[:latLng]).to be_a(Hash)
      expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
      expect(response[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
      expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
      expect(response[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
    end
  end
end
