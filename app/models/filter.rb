require 'pry'

class Filter
attr_accessor :filter_start_date, :filter_end_date
  def initialize(filter_start_date, filter_end_date)
    @filter_start_date = filter_start_date
    @filter_end_date = filter_end_date
  end

  def compare_dates(listing)
    availability_start = listing.start_date.gsub(/\-/, "")
    availability_end = listing.end_date.gsub(/\-/, "")
    start_within_availabity = (@filter_start_date > availability_start) && (@filter_start_date < availability_end)
    end_within_availability = (@filter_end_date > availability_start )&&(@filter_end_date < availability_end)
    if  start_within_availabity && end_within_availability
      return listing
    end
  end
end
