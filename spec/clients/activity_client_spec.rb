require 'rails_helper'

RSpec.describe ActivityClient do
  describe 'api connection' do
    it 'returns activity data' do
      response = ActivityClient.find_activity("recreational")
      expect(response).to be_a(Hash)
      expect(response).to have_key(:activity)
      expect(response[:activity]).to be_a(String)
      expect(response).to have_key(:accessibility)
      expect(response[:accessibility]).to be_a(Float).or be_an(Integer)
      expect(response).to have_key(:type)
      expect(response[:type]).to be_a(String)
      expect(response).to have_key(:participants)
      expect(response[:participants]).to be_an(Integer)
      expect(response).to have_key(:price)
      expect(response[:price]).to be_a(Float).or be_an(Integer)
      expect(response).to have_key(:key)
      expect(response[:key]).to be_a(String)
      binding.pry
    end
  end
end
