require 'pry'
require_relative 'filter'

class Filter
  attr_accessor :filter_start_date, :filter_end_date
    def initialize(renter_start_date, renter_end_date)
      @renter_start_date = renter_start_date
      @renter_end_date = renter_end_date
      filtered_spaces = Array.new(0)
      spaces = Listing.all
    end

  def self.filter_spaces
    for space in spaces
      if renter_start_date >= listing.start_date && renter_end_date <= listing.end_date
        filtered_spaces << space
      end
    end
    filtered_spaces
  end
end
