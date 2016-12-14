module ListingHelpers

  def new_listing(
    name: "Sunny palace",
    description: "Beautiful views, clogged toilets.",
    price: 15,
    start_date: "25/12/2016",
    end_date: "26/12/2016"
    )
    visit '/listings/new'
    fill_in("name", with: name)
    fill_in("description", with: description)
    fill_in("price", with: price)
    fill_in("start_date", with: start_date)
    fill_in("end_date", with: end_date)
    click_button('List my Space')
  end
end
