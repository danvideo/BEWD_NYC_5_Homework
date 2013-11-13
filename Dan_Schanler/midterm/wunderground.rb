# wunderground.rb
require 'rest-client'
require 'JSON'

$API_KEY = ENV['WUNDERGROUND_API_KEY'] 
# can get an API key from their site and put it into ENV variables as WUNDERGROUND_API_KEY
# http://www.wunderground.com/weather/api

class WeatherQuery
  attr_reader :city, :state_country
  def initialize city, state_country
    @city = city
    @state_country = state_country
  end
end

class Forecast
  attr_reader :time, :desc, :temp, :wind
  def initialize time, desc, temp, wind
      @time = time
      @desc = desc
      @temp = temp
      @wind = wind
  end
end

class QueryProcessor

  def process_query weather_query
    result = RestClient.get('http://api.wunderground.com/api/' + $API_KEY + '/geolookup/conditions/q/' + weather_query.state_country + '/' + weather_query.city + '.json')
    parsed = JSON.parse result
    
    time = parsed["current_observation"]["observation_time"]
    desc = parsed["current_observation"]["weather"]
    temp = parsed["current_observation"]["temperature_string"]
    wind = parsed["current_observation"]["windchill_string"]

    the_forecast = Forecast.new time, desc, temp, wind
    return the_forecast
  end

end

