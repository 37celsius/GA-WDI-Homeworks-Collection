require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal
require_relative 'config'
require_relative 'movie'

binding.pry