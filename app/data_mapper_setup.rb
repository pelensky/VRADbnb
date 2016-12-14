require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'

require_relative './models/listing.rb'
require_relative './models/user.rb'
require_relative './models/owner.rb'
require_relative './models/renter.rb'

DataMapper.setup(:default, "postgres://localhost/vradbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
