require 'data_mapper'
require 'dm-postgres-adapter'


class Listing
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :start_date, String
  property :end_date, String



end


DataMapper.setup(:default, "postgres://localhost/vradbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
