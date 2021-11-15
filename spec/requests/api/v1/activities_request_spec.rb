require 'rails_helper'

RSpec.describe 'Activities API', :vcr do
  describe '/api/v1/activities' do
    describe 'happy paths' do
      it 'returns activities for destination' do
        get '/api/v1/activities?destination=Denver,CO'
        expect(response).to be_successful
        activities = JSON.parse(response.body, symbolize_names: true)
        expect(activities).to be_a(Hash)
        expect(activities).to have_key(:data)
        expect(activities[:data]).to be_a(Hash)
        expect(activities[:data]).to have_key(:id)
        expect(activities[:data][:id]).to be(nil)
        expect(activities[:data]).to have_key(:attributes)
        expect(activities[:data][:attributes]).to have_key(:destination)
        expect(activities[:data][:attributes][:destination]).to be_a(String)
        expect(activities[:data][:attributes]).to have_key(:forecast)
        expect(activities[:data][:attributes][:forecast]).to be_a(Hash)
        expect(activities[:data][:attributes][:forecast]).to have_key(:summary)
        expect(activities[:data][:attributes][:forecast][:summary]).to be_a(String)
        expect(activities[:data][:attributes][:forecast]).to have_key(:temperature)
        expect(activities[:data][:attributes][:forecast][:temperature]).to be_a(Float).or be_an(Integer)
        expect(activities[:data][:attributes]).to have_key(:activities)
        expect(activities[:data][:attributes][:activities]).to be_an(Array)
        expect(activities[:data][:attributes][:activities].first).to be_a(Hash)
        expect(activities[:data][:attributes][:activities].first).to have_key(:title)
        expect(activities[:data][:attributes][:activities].first[:title]).to be_a(String)
        expect(activities[:data][:attributes][:activities].first).to have_key(:type)
        expect(activities[:data][:attributes][:activities].first[:type]).to be_a(String)
        expect(activities[:data][:attributes][:activities].first).to have_key(:participants)
        expect(activities[:data][:attributes][:activities].first[:participants]).to be_an(Integer)
        expect(activities[:data][:attributes][:activities].first).to have_key(:price)
        expect(activities[:data][:attributes][:activities].first[:price]).to be_a(Float).or be_an(Integer)
      end
    end
    describe 'sad paths' do
      it '400 without destination' do
        get '/api/v1/activities'
        expect(response.status).to eq(400)
      end
    end
  end
end
