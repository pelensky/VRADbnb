class Filter

  def compare_dates(listing, filter_start_date, filter_end_date)
    availibility_start = listing.start_date.gsub(/\-/, "")
    availibility_end = listing.end_date.gsub(/\-/, "")
    if availibility_start <= @filter_start_date > availibility_end && availibility_start < @filter_end_date >= availibility_end
      return listing
    end
  end
end
