feature "Signing out" do

  scenario "user signs out" do
    sign_up
    sign_in
    click_link "Log Out"
    expect(current_path).to eq('/listings')
    expect(page).to have_content("Log out successful.")
    expect(page).not_to have_content("Aloha")
  end

end
