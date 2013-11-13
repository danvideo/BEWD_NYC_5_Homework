# wunder_runner.rb

require_relative 'wunderground'

## TODO LIST
## need to do santizing of inputs - working on it now for an update
## do some more logic to requested query - compare to yesterday
## display something a little bit prettier

puts
puts "Welcome. You may enter a location to check its current temperature."
puts
puts "USA [city/state]                    or  Elsewhere [city/country]"
puts "Kansas_City, KA (no spaces please)      Paris, France"
puts
print "City: "
city_nospaces = gets.chomp
puts
print "State/Country: "
state_abbr = gets.chomp
puts

query = WeatherQuery.new(city_nospaces, state_abbr)

forecast = QueryProcessor.new.process_query query

puts forecast.time 
puts forecast.desc 
puts forecast.temp 
puts forecast.wind


# -------------------------
# WUNDERGROUND example code:

	# require 'open-uri'

	# open('http://api.wunderground.com/api/' + 'API_KEY' + '/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f| 
	# json_string = f.read 
	# parsed_json = JSON.parse(json_string) 
	# location = parsed_json['location']['city'] 
	# temp_f = parsed_json['current_observation']['temp_f'] 
	# print "Current temperature in #{location} is: #{temp_f}\n" end

