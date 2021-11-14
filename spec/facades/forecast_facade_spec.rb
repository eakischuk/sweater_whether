require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  it 'receives location and returns forecast poro' do
    response = ForecastFacade.weather_by_location('Denver, CO')
    expect(response).to be_a(Forecast)
  end
end
