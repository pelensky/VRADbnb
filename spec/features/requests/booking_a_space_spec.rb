feature "bookinging a space" do

  scenario "user books crack house for 15/12/2016" do
    sign_up_o
    new_listing
    click_link("Log Out")
    sign_up_r
    expect(current_path).to eq('/listings')
    click_button('Book')
    expect(page).to have_content("Sunny palace")
    expect(page).to have_content("Book a date for the property 7")
    fill_in "date", with: "25/12/2016"
    click_button("submit")
    expect(current_path).to eq('/booking/7')

  end
end
