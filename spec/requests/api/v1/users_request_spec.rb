require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'user registration' do
    describe 'happy paths' do
      before(:each) do
        @headers = {
          'Content-Type': "application/json",
          'Accept': "application/json"
        }
        @new_user_params = {
          email: 'fake.email@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      end
      it 'creates new user with api key' do
        post '/api/v1/users', headers: @headers, params: @new_user_params.to_json
        expect(response.status).to eq(201)
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
      before(:each) do
        @headers = {
          'Content-Type': "application/json",
          'Accept': "application/json"
        }
      end
      it 'returns 400 error with invalid password' do
        bad_user_params = {
          email: 'fake.email@example.com',
          password: 'password',
          password_confirmation: 'not_password'
        }
        post '/api/v1/users', headers: @headers, params: bad_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)

        no_pw_user_params = {
          email: 'fake.email@example.com',
          password_confirmation: 'not_password'
        }
        post '/api/v1/users', headers: @headers, params: no_pw_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)

        no_conf_user_params = {
          email: 'fake.email@example.com',
          password: 'password'
        }

        post '/api/v1/users', headers: @headers, params: no_conf_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)

        only_email_user_params = {
          email: 'fake.email@example.com'
        }

        post '/api/v1/users', headers: @headers, params: only_email_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)
      end

      it 'returns 400 with invalid email' do
        bad_user_params = {
          password: 'password',
          password_confirmation: 'password'
        }
        post '/api/v1/users', headers: @headers, params: bad_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)
      end

      it 'disallows duplicate users' do
        new_user_params = {
          email: 'fake.email@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
        post '/api/v1/users', headers: @headers, params: new_user_params.to_json

        duplicate_user_params = {
          email: 'fake.email@example.com',
          password: 'still_a_password',
          password_confirmation: 'still_a_password'
        }

        post '/api/v1/users', headers: @headers, params: duplicate_user_params.to_json
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to have_key(:error)
      end
    end
  end
end
