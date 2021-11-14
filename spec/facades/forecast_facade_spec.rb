require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  it 'receives location and returns forecast poro' do
    response = ForecastFacade.weather_by_location('Denver, CO')
    expect(response).to be_a(Forecast)
    expect(response.daily_weather.count).to eq(5)
    expect(response.hourly_weather.count).to eq(8)
  end
end
