class Book
  include DataMapper::Resource


  property :id, Serial
  property :date, String, required: true
  property :confirmed, Boolean, default: false

  belongs_to :renter
  belongs_to :listing

end
