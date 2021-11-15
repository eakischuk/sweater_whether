require 'rails_helper'

RSpec.describe 'Image API', :vcr do
  describe 'happy paths' do
    describe '/api/v1/backgrounds' do
      it 'returns background links and credit' do
        get '/api/v1/backgrounds?location=denver, co'
        expect(response).to be_successful

        background = JSON.parse(response.body, symbolize_names: true)
        expect(background).to be_a(Hash)
        expect(background).to have_key(:data)
        expect(background[:data]).to be_a(Hash)
        expect(background[:data]).to have_key(:id)
        expect(background[:data][:id]).to be(nil)
        expect(background[:data]).to have_key(:type)
        expect(background[:data][:type]).to be_a(String)
        expect(background[:data]).to have_key(:attributes)
        expect(background[:data][:attributes]).to be_a(Hash)
        expect(background[:data][:attributes]).to have_key(:image_urls)
        expect(background[:data][:attributes][:image_urls]).to be_a(Hash)
        expect(background[:data][:attributes][:image_urls]).to have_key(:raw)
        expect(background[:data][:attributes][:image_urls][:raw]).to be_a(String)
        expect(background[:data][:attributes][:image_urls]).to have_key(:full)
        expect(background[:data][:attributes][:image_urls][:full]).to be_a(String)
        expect(background[:data][:attributes][:image_urls]).to have_key(:regular)
        expect(background[:data][:attributes][:image_urls][:regular]).to be_a(String)
        expect(background[:data][:attributes][:image_urls]).to have_key(:small)
        expect(background[:data][:attributes][:image_urls][:small]).to be_a(String)
        expect(background[:data][:attributes][:image_urls]).to have_key(:thumb)
        expect(background[:data][:attributes][:image_urls][:thumb]).to be_a(String)
        expect(background[:data][:attributes]).to have_key(:credit)
        expect(background[:data][:attributes][:credit]).to be_a(Hash)
        expect(background[:data][:attributes][:credit]).to have_key(:user_name)
        expect(background[:data][:attributes][:credit][:user_name]).to be_a(String)
        expect(background[:data][:attributes][:credit]).to have_key(:user_portfolio_url)
        expect(background[:data][:attributes][:credit][:user_portfolio_url]).to be_a(String)
      end
    end
  end
  describe 'sad paths' do
    describe '/api/v1/backgrounds' do
      it 'returns 400 if no location' do
        get '/api/v1/backgrounds'
        expect(response.status).to eq(400)
      end
    end
  end
end
