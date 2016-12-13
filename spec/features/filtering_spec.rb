feature "Filter spaces" do
  scenario "renter can see all spaces" do
    sign_up
    new_listing
    new_listing2
    expect(page).to have_content("victorian")
    expect(page).to have_content("palace")
  end
end
