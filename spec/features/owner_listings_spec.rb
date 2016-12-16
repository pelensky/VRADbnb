feature "Owner views their listings" do
  scenario "owner has one listing" do
    sign_up_o
    new_listing
    visit('/listings/my_listings')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sunny palace')
  end

  scenario "renter tries to look at owner listing" do
    sign_up_r
    visit('/listings/my_listings')
    expect(page).to have_content('You are not a owner, please make an owner account')
  end

end
