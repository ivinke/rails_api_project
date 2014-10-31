


class WeatherController < ApplicationController

require 'open-uri'
require 'json'

  def location

    @b = params[:address]



url_of_data_we_want = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @b

raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)


@the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
@the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

url_of_weather_we_want = "https://api.forecast.io/forecast/cc9e23dfdaa96dd75a1e215f3abe04cd/#{@the_latitude},#{@the_longitude}"


raw_data1 = open(url_of_weather_we_want).read
parsed_data1 = JSON.parse(raw_data1)

@the_temperature = parsed_data1["currently"]["temperature"]
@the_hour_outlook = parsed_data1["hourly"]["summary"]
@the_day_outlook = parsed_data1["daily"]["summary"]


  end


end
