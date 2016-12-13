module ListingHelpers

  def new_listing(
    name: "Sunny palace",
    description: "Beautiful views, clogged toilets.",
    price: 15,
    start_date: "25/12/16",
    end_date: "26/12/16"
    )
    visit '/listings/new'
    fill_in("name", with: name)
    fill_in("description", with: description)
    fill_in("price", with: price)
    fill_in("start_date", with: start_date)
    fill_in("end_date", with: end_date)
    click_button('List my Space')
  end

  def new_listing2(
    name: "Sunny victorian house",
    description: "Beautiful views, clogged toilets.",
    price: 15,
    start_date: "01/12/16",
    end_date: "10/12/16"
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
