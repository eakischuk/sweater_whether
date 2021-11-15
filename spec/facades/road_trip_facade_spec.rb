require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns roadtrip poro with start and destination' do
    trip = RoadTripFacade.road_trip('Denver, CO', 'Indianapolis, IN')
    expect(trip).to be_a(RoadTrip)
  end
end
