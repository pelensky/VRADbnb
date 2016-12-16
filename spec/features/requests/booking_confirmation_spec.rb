feature "When a renter has made a booking" do

  scenario "owner can see a request" do
    book_a_place
    sign_in_o
    visit '/booking/owner_history'
    expect(page).to have_content("Sunny palace")
    expect(page).to have_button("Confirm")
  end

  scenario "and the property of listing requested changes to true" do
    book_a_place
    listing = Listing.first(name: "Sunny palace")
    expect(listing.requested).to eq(true)
  end

  scenario "owner confirms" do
    book_a_place
    sign_in_o
    visit '/booking/owner_history'
    click_button('Confirm')
    sign_in_r
    visit('/booking/renter_history')
    expect(page).to have_content("Sunny palace")
    expect(page).to have_content("Confirmed")
  end
end
