require 'rails_helper'

RSpec.describe BackgroundService, :vcr do
  it 'returns an image url' do
    response = BackgroundService.background('Denver, CO')
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first).to be_a(Hash)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first[:urls]).to be_an(Hash)
    expect(response[:results].first[:urls]).to have_key(:raw)
    expect(response[:results].first[:urls][:raw]).to be_a(String)
    expect(response[:results].first[:urls]).to have_key(:full)
    expect(response[:results].first[:urls][:full]).to be_a(String)
    expect(response[:results].first[:urls]).to have_key(:regular)
    expect(response[:results].first[:urls][:regular]).to be_a(String)
    expect(response[:results].first[:urls]).to have_key(:small)
    expect(response[:results].first[:urls][:small]).to be_a(String)

    expect(response[:results].first).to have_key(:user)
    expect(response[:results].first[:user]).to be_a(Hash)
    expect(response[:results].first[:user]).to have_key(:name)
    expect(response[:results].first[:user][:name]).to be_a(String)
    expect(response[:results].first[:user]).to have_key(:portfolio_url)
    expect(response[:results].first[:user][:portfolio_url]).to be_a(String)
  end
end
