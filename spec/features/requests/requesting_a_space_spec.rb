feature "requesting a space" do
  scenario "user books crack house for 15/12/2016" do
    sign_up_o
    new_listing
    click_link("Log Out")
    sign_up_r
    expect(current_path).to eq('/listings')
    click_button('Request')
    expect(page).to have_content "Requests"
    fill_in "date", with: "25/12/2016"
    click_button("submit")
  end
end
