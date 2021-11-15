require 'rails_helper'

RSpec.describe 'Session API' do
  before(:each) do
    @headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }
    key = SecureRandom.urlsafe_base64
    user_params = {
      email: 'fake_email@woohoo.com',
      password: 'secret',
      password_confirmation: 'secret',
      api_key: key
    }
    @user = User.create(user_params)
  end
  describe 'happy paths' do
    before(:each) do
      @login_params = {
        email: @user.email,
        password: 'secret'
      }
    end
    it 'returns correct user info' do
      post '/api/v1/sessions', headers: @headers, params: @login_params.to_json
      expect(response).to be_successful
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
    end
  end
  describe 'sad paths' do
    it 'returns 400 incorrect email' do
      bad_email_params = {
        email: 'not_the_email@fake.com',
        password: 'secret'
      }
      post '/api/v1/sessions', headers: @headers, params: bad_email_params.to_json
      expect(response.status).to eq(400)

      no_email_params = {
        password: 'secret'
      }
      post '/api/v1/sessions', headers: @headers, params: no_email_params.to_json
      expect(response.status).to eq(400)
    end
    it 'returns 400 incorrect password' do
      bad_pw_params = {
        email: @user.email,
        password: 'incorrect'
      }
      post '/api/v1/sessions', headers: @headers, params: bad_pw_params.to_json
      expect(response.status).to eq(400)

      no_pw_params = {
        email: @user.email
      }
      post '/api/v1/sessions', headers: @headers, params: no_pw_params.to_json
      expect(response.status).to eq(400)
    end
  end
end
