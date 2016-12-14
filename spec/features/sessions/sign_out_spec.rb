feature "Signing out" do

  scenario "owner signs out" do
    sign_up_o
    click_link "Log Out"
    expect(current_path).to eq('/listings')
    expect(page).to have_content("Log out successful.")
    expect(page).not_to have_content("Aloha")
  end

  scenario "renter signs out" do
    sign_up_r
    click_link "Log Out"
    expect(current_path).to eq('/listings')
    expect(page).to have_content("Log out successful.")
    expect(page).not_to have_content("Aloha")
  end

end
