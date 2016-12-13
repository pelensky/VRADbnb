require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'


class Listing
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :start_date, Date, required: true
  property :end_date, Date, required: true

  validates_primitive_type_of :start_date,
    :message => "Please enter start date in correct format"

  validates_primitive_type_of :end_date,
    :message => "Please enter end date in correct format"


    has n, :dates, through: Resource
end


DataMapper.setup(:default, "postgres://localhost/vradbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
