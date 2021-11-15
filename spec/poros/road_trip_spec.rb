require 'rails_helper'

RSpec.describe RoadTrip do
  before(:each) do
    @trip_data = {
      :start_city=>'Denver, CO',
      :end_city=>'Indianapolis, IN',
      :travel=>{:time=>"15:37:17", :messages=>[]},
      :weather=>
      {:dt=>1636995600,
       :temp=>38.26,
       :feels_like=>33.17,
       :pressure=>1022,
       :humidity=>53,
       :dew_point=>22.39,
       :uvi=>1.29,
       :clouds=>97,
       :visibility=>10000,
       :wind_speed=>6.8,
       :wind_deg=>233,
       :wind_gust=>10.4,
       :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
       :pop=>0}}

    @trip = RoadTrip.new(@trip_data)
  end

  it 'exits and has attributes' do
    weather_expectations = {
      temperature: 38.26,
      conditions: 'overcast clouds'
    }
    expect(@trip.start_city).to eq("Denver, CO")
    expect(@trip.end_city).to eq("Indianapolis, IN")
    expect(@trip.travel_time).to eq('15 hours, 37 minutes')
    expect(@trip.weather_at_eta).to eq(weather_expectations)
  end
end
