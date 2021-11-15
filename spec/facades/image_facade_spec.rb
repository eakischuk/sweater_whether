require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  it 'returns background with location search' do
    response = ImageFacade.background_search('Denver, CO')
    expect(response).to be_a(Image)
  end
end
