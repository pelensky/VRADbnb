require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'


class Listing
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :start_date, String, required: true
  property :end_date, String, required: true

  belongs_to :owner
  has n, :requests

end
