feature "renter's history page" do

  scenario "should see a list of all the renter's bookings" do
    book_a_place
    # visit '/booking/1'
    expect(page).to have_content("Sunny palace")
  end
end
