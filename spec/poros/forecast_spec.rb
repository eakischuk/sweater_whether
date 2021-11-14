require 'rails_helper'

RSpec.describe Forecast do
  before(:each) do
    @weather = {:lat=>39.7392,
   :lon=>-104.9847,
   :timezone=>"America/Denver",
   :timezone_offset=>-25200,
   :current=>
    {:dt=>1636851129,
     :sunrise=>1636810962,
     :sunset=>1636847163,
     :temp=>57.7,
     :feels_like=>54.59,
     :pressure=>1015,
     :humidity=>30,
     :dew_point=>27.16,
     :uvi=>0,
     :clouds=>0,
     :visibility=>10000,
     :wind_speed=>1.01,
     :wind_deg=>148,
     :wind_gust=>1.99,
     :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
   :hourly=>
    [{:dt=>1636848000,
      :temp=>57.88,
      :feels_like=>54.68,
      :pressure=>1015,
      :humidity=>28,
      :dew_point=>25.81,
      :uvi=>0,
      :clouds=>14,
      :visibility=>10000,
      :wind_speed=>7.09,
      :wind_deg=>339,
      :wind_gust=>12.88,
      :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02n"}],
      :pop=>0},
     {:dt=>1636851600,
      :temp=>57.7,
      :feels_like=>54.59,
      :pressure=>1015,
      :humidity=>30,
      :dew_point=>27.16,
      :uvi=>0,
      :clouds=>0,
      :visibility=>10000,
      :wind_speed=>2.3,
      :wind_deg=>252,
      :wind_gust=>2.89,
      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
      :pop=>0}],
    :daily=>
      [{:dt=>1636826400,
        :sunrise=>1636810962,
        :sunset=>1636847163,
        :moonrise=>1636838880,
        :moonset=>1636790160,
        :moon_phase=>0.33,
        :temp=>{:day=>60.12, :min=>47.01, :max=>63.77, :night=>50.95, :eve=>57.88, :morn=>48.06},
        :feels_like=>{:day=>57.06, :night=>47.35, :eve=>54.68, :morn=>45.57},
        :pressure=>1015,
        :humidity=>26,
        :dew_point=>24.91,
        :wind_speed=>8.05,
        :wind_deg=>295,
        :wind_gust=>26.37,
        :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
        :clouds=>100,
        :pop=>0,
        :uvi=>2.07},
       {:dt=>1636912800,
        :sunrise=>1636897431,
        :sunset=>1636933514,
        :moonrise=>1636926720,
        :moonset=>1636880400,
        :moon_phase=>0.36,
        :temp=>{:day=>60.51, :min=>42.46, :max=>66.43, :night=>53.22, :eve=>62.04, :morn=>42.46},
        :feels_like=>{:day=>57.2, :night=>49.84, :eve=>59.13, :morn=>42.46},
        :pressure=>1014,
        :humidity=>20,
        :dew_point=>18.81,
        :wind_speed=>10.74,
        :wind_deg=>293,
        :wind_gust=>30,
        :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
        :clouds=>57,
        :pop=>0,
        :uvi=>2.66}]
      }
    @forecast = Forecast.new(@weather)
  end
  it 'exists and has attributes' do
    expect(@forecast.current_weather[:datetime]).to eq(Time.at(@weather[:current][:dt], in: @weather[:timezone_offset]))
    expect(@forecast.current_weather[:sunrise]).to eq(Time.at(@weather[:current][:sunrise], in: @weather[:timezone_offset]))
    expect(@forecast.current_weather[:sunset]).to eq(Time.at(@weather[:current][:sunset], in: @weather[:timezone_offset]))
    expect(@forecast.current_weather[:temperature]).to eq(@weather[:current][:temp])
    expect(@forecast.current_weather[:feels_like]).to eq(@weather[:current][:feels_like])
    expect(@forecast.current_weather[:humidity]).to eq(@weather[:current][:humidity])
    expect(@forecast.current_weather[:uvi]).to eq(@weather[:current][:uvi])
    expect(@forecast.current_weather[:visibility]).to eq(@weather[:current][:visibility])
    expect(@forecast.current_weather[:conditions]).to eq(@weather[:current][:weather].first[:description])
    expect(@forecast.current_weather[:icon]).to eq(@weather[:current][:weather].first[:icon])

    expect(@forecast.daily_weather.first[:date]).to eq(Time.at(@weather[:daily].first[:dt], in: @weather[:timezone_offset]))
    expect(@forecast.daily_weather.first[:sunrise]).to eq(Time.at(@weather[:daily].first[:sunrise], in: @weather[:timezone_offset]))
    expect(@forecast.daily_weather.first[:sunset]).to eq(Time.at(@weather[:daily].first[:sunset], in: @weather[:timezone_offset]))
    expect(@forecast.daily_weather.first[:max_temp]).to eq(@weather[:daily].first[:temp][:max])
    expect(@forecast.daily_weather.first[:min_temp]).to eq(@weather[:daily].first[:temp][:min])
    expect(@forecast.daily_weather.first[:conditions]).to eq(@weather[:daily].first[:weather].first[:description])
    expect(@forecast.daily_weather.first[:icon]).to eq(@weather[:daily].first[:weather].first[:icon])

    expect(@forecast.hourly_weather.first[:time]).to eq(Time.at(@weather[:hourly].first[:dt], in: @weather[:timezone_offset]))
    expect(@forecast.hourly_weather.first[:temperature]).to eq(@weather[:hourly].first[:temp])
    expect(@forecast.hourly_weather.first[:conditions]).to eq(@weather[:hourly].first[:weather].first[:description])
    expect(@forecast.hourly_weather.first[:icon]).to eq(@weather[:hourly].first[:weather].first[:icon])
  end
end
