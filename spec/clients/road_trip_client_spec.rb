require 'rails_helper'

RSpec.describe RoadTripClient do
  it 'successful api call' do
    response = RoadTripClient.travel_time('Denver, CO', 'Indianapolis, IN')
    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to be_a(Hash)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route][:formattedTime]).to be_a(String)
  end
end
