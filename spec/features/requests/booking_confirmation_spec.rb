feature "When a renter has made a booking" do

  scenario "owner can see a request" do
    book_a_place
    sign_in_o
    visit '/booking/history'
    expect(page).to have_content("Sunny palace")
    expect(page).to have_button("Confirm")
  end


end
