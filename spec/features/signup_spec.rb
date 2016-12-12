feature "signup" do
  scenario "user can sign up" do
    visit '/signup'
    expect(page.status_code).to eq(200)
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "12345"
    fill_in :confirm_password, with: "12345"
    click_button "Sign Up"
    expect(page).to have_current_path('/listings/new')
  end
end
