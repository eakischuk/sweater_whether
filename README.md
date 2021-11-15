# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
`ruby 2.7.2`
`rails, ~> 6.1.4, >= 6.1.4.1`

* System dependencies
  - Production
    - `bcrypt ~> 3.1.7`
    - `jsonapi-serializer`
    - `figaro`
    - `faraday`
  - Testing
    - `capybara`
    - `webmock`
    - `vcr`
    - `shoulda-matchers`
    - `rspec-rails`
* API's
  - [OpenWeather API *](https://openweathermap.org/api/one-call-api)
  - [MapQuest Geocoding API **](https://developer.mapquest.com/documentation/geocoding-api/)
  - [MapQuest Directions API **](https://developer.mapquest.com/documentation/directions-api/)
  - [UnSplash Photo API *](https://unsplash.com/documentation#search-photos)
  - [Bored API](https://www.boredapi.com/documentation)

  *requires API key
  **requires same API key
* Configuration
  - `git clone git@github.com:eakischuk/sweater_whether.git`
  - `bundle install`
  - `rails g rspec:install`
  - `bundle exec figaro install`
  - add api keys to `config/application.yml`

* Database creation - postgreSQL
  - `rails db:{create,migrate}

* How to run the test suite
  - `bundle exec rspec`

* Endpoints
  - get /api/v1/forecast
    - params: location (string)
  - get /api/v1/backgrounds
    - params: location (string)
  - post /api/v1/users
    - params: as json body
      - email, password, password_confirmation
    - returns api_key for user
  - post /api/v1/sessions
    - params: as json body
      - email, password
  - post /api/v1/road_trip
    - params: as json body
      - origin, destination, api_key

* Deployment instructions
  * can be tested on using Postman with http://localhost:3000 by running `rails s`

