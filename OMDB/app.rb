# Local Host
require 'sinatra'
# Local Host Live Reload Without exit sinatra
require 'sinatra/reloader'
# API for Movie JSON
require 'httparty'
# Basic debugger
require 'pry'
# JSON
require 'json'
# Help with strange character for the URL
require 'uri'
# Database GEM (postgresql database)
require 'pg'

# Link to the function in config.rb
# Like @import from Sass
require_relative 'config'
# Link to the function in movie.rb
# Like @import from Sass
require_relative 'movie'


# Ensures that we don't run out of connections (works like db.close)
after do
  ActiveRecord::Base.connection.close
end

# Link to index
get '/' do
	erb :index
end

get '/about' do
	erb :about
end

# Link to Result page
get '/result' do
	# This is just to make the URL ADDRESS much better
	@url = "http://www.omdbapi.com/?s=#{params[:movieName]}"
	@raw_data = HTTParty.get @url
  	@search_results = JSON.parse @raw_data
	erb :result
end

# Link to Search History page
get '/searchHistory' do
	erb :searchHistory
end