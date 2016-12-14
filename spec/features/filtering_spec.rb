
feature "Filter spaces" do
  scenario "renter can see all spaces" do
    sign_up_o
    new_listing
    new_listing(name: "victorian",
    description: "Crack house, with beautiful view",
    price: 1000,
    start_date: "02/12/2016",
    end_date: "10/12/2016")
    # sign_out_o?
    sign_up_r
    expect(current_path).to eq('/listings')
    expect(page).to have_content("victorian")
    expect(page).to have_content("palace")
  end

  scenario "renter can see filtered spaces" do
    sign_up_o
    new_listing
    new_listing(name: "victorian",
    description: "Crack house, with beautiful view",
    price: 1000,
    start_date: "02/12/2016",
    end_date: "10/12/2016")
    new_listing(name: "paradize",
    description: "Beach house, in supermarket parking",
    price: 20000,
    start_date: "15/12/2016",
    end_date: "20/12/2016")
    # sign_out_o?
    sign_up_r
    expect(current_path).to eq('/listings')
    fill_in("start_date", with:"03/12/2016")
    fill_in("end_date", with:"10/12/2016")
    click_button("List Spaces")
    expect(page).to have_content("victorian")
    expect(page).not_to have_content("paradize")
    expect(page).not_to have_content("palace")
  end
end
