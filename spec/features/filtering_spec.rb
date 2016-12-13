
feature "Filter spaces" do
  scenario "renter can see all spaces" do
    sign_up
    new_listing
    new_listing2
    expect(page).to have_content("victorian")
    expect(page).to have_content("palace")
  end

  scenario "renter can see filtered spaces" do
    sign_up
    new_listing
    new_listing2
    fill_in("start_date",with: "05/12/2016")
    fill_in("end_date",with: "06/12/2016")

    click_button("List Spaces")
    expect(page).to have_content("victorian")
    expect(page).not_to have_content("palace")
  end
end
