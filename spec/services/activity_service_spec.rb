require 'rails_helper'

RSpec.describe ActivityService, :vcr do
  it 'returns correct activities for destination' do
    response = ActivityService.activities_for("Denver, CO")
    expect(response).to be_a(Hash)
    expect(response).to have_key(:destination)
    expect(response[:destination]).to be_a(String)
    expect(response).to have_key(:forecast)
    expect(response[:forecast]).to be_a(Hash)
    expect(response[:forecast]).to have_key(:summary)
    expect(response[:forecast][:summary]).to be_a(String)
    expect(response[:forecast]).to have_key(:temperature)
    expect(response[:forecast][:temperature]).to be_a(Float).or be_an(Integer)
    expect(response).to have_key(:activities)
    expect(response[:activities]).to be_an(Array)
    expect(response[:activities].first).to be_a(Hash)
    expect(response[:activities].first).to have_key(:activity)
    expect(response[:activities].first[:activity]).to be_a(String)
    expect(response[:activities].first).to have_key(:type)
    expect(response[:activities].first[:type]).to be_a(String)
    expect(response[:activities].first).to have_key(:participants)
    expect(response[:activities].first[:participants]).to be_an(Integer)
    expect(response[:activities].first).to have_key(:price)
    expect(response[:activities].first[:price]).to be_a(Float).or be_an(Integer)
  end
end
