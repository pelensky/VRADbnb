require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'

class Date
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date, required: true
  property :end_date, Date, required: true


  has n :listings, through: Resource

end

DataMapper.setup(:default, "postgres://localhost/vradbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
