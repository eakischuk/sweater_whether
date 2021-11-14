require 'rails_helper'

RSpec.describe BackgroundFacade, :vcr do
  it 'returns background with location search' do
    response = BackgroundFacade.background_search('Denver, CO')
    expect(response).to be_a(Background)
  end
end
