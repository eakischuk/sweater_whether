require 'rails_helper'

RSpec.describe 'RoadTrip API' do
  before(:each) do
    @headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }
    key = SecureRandom.urlsafe_base64
    user_params = {
      email: 'fake_email@woohoo.com',
      password: 'secret',
      password_confirmation: 'secret',
      api_key: key
    }
    @user = User.create(user_params)
  end
  describe 'happy paths' do
    before(:each) do
      @trip_params = {
        origin: "Denver, CO",
        destination: "Indianapolis, IN",
        api_key: @user.api_key
      }
    end
    it 'returns a roadtrip' do
      post '/api/v1/road_trip', headers: @headers, params: @trip_params.to_json
      expect(response).to be_successful
      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip).to be_a(Hash)
      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to be(nil)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to be_a(String)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to be_a(Hash)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_an(Integer)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
  describe 'sad paths' do
    it '401 without authorization' do
      unauthorized_params = {
        origin: "Denver, CO",
        destination: "Indianapolis, IN"
      }
      post '/api/v1/road_trip', headers: @headers, params: unauthorized_params.to_json
      expect(response.status).to eq(401)
    end
    it '400 without origin' do
      bad_trip_params = {
        origin: "Denver, CO",
        api_key: @user.api_key
      }
      post '/api/v1/road_trip', headers: @headers, params: bad_trip_params.to_json
      expect(response.status).to eq(400)
    end
    it '400 without destination' do
      bad_trip_params = {
        destination: "Denver, CO",
        api_key: @user.api_key
      }
      post '/api/v1/road_trip', headers: @headers, params: bad_trip_params.to_json
      expect(response.status).to eq(400)
    end
  end
end
