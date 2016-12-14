class Request
  include DataMapper::Resource


  property :id, Serial
  property :date, String, required: true


  belongs_to :renter
  belongs_to :listing

end
