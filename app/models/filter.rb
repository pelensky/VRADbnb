require 'pry'
require_relative 'filter'

class Filter
  attr_reader :spaces, :renter_start_date, :renter_end_date
    def initialize(renter_start_date, renter_end_date)
      @renter_start_date = renter_start_date.gsub(/\//, "")
      @renter_end_date = renter_end_date.gsub(/\//, "")
      @spaces = Listing.all
    end

  def filter_spaces
    filtered_spaces = Array.new(0)
    @spaces.each do |listing|
      space_start = listing.start_date.gsub(/\//, "")
      space_end = listing.end_date.gsub(/\//, "")

      if @renter_start_date < space_start && @renter_end_date > space_end
        filtered_spaces << listing

      end
    end
    filtered_spaces
  end
end
