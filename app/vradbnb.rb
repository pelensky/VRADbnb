ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/bookings'
require_relative 'controllers/listings'
require_relative 'controllers/owner_sessions'
require_relative 'controllers/renter_sessions'
