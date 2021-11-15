require 'rails_helper'

RSpec.describe RoadTripService do
  it 'returns data hash; weather and travel' do
    response = RoadTripService.road_trip('Denver, CO', 'Indianapolis, IN')
    expect(response).to be_a(Hash)
    expect(response).to have_key(:start_city)
    expect(response[:start_city]).to be_a(String)
    expect(response).to have_key(:end_city)
    expect(response[:end_city]).to be_a(String)
    expect(response).to have_key(:travel)
    expect(response[:travel]).to be_a(Hash)
    expect(response[:travel]).to have_key(:time)
    expect(response[:travel][:time]).to be_a(String)
    expect(response[:travel]).to have_key(:messages)
    expect(response[:travel][:messages]).to be_an(Array)
    expect(response).to have_key(:weather)
    expect(response[:weather]).to be_a(Hash)
    expect(response[:weather]).to have_key(:temp)
    expect(response[:weather][:temp]).to be_a(Float).or be_an(Integer)
    expect(response[:weather]).to have_key(:weather)
    expect(response[:weather][:weather]).to be_an(Array)
    expect(response[:weather][:weather].first).to have_key(:description)
    expect(response[:weather][:weather].first[:description]).to be_a(String)
  end
end
