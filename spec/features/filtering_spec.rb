
feature "Filter spaces" do
  scenario "renter can see all spaces" do
    sign_up
    new_listing
    new_listing(name: "victorian", description: "Crack house, with beautiful view", price: 1000, start_date: "02/12/2016", end_date: "10/12/2016")
    expect(page).to have_content("victorian")
    expect(page).to have_content("palace")
  end

  scenario "renter can see filtered spaces" do
    sign_up
    new_listing
    new_listing(name: "victorian", description: "Crack house, with beautiful view", price: 1000, start_date: "02/12/2016", end_date: "10/12/2016")
    expect(current_path).to eq('/listings')
    fill_in("start_date", with:"01/12/2016")
    fill_in("end_date", with:"11/12/2016")
    click_button("List Spaces")
    expect(page).to have_content("victorian")
    expect(page).not_to have_content("palace")
  end
end
