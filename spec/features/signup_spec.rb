feature "signup" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_current_path('/listings/new')
  end

  scenario "a user should be added to the Data Base" do
    user = User.all
    expect{ sign_up }.to change(User, :count).by(1)
  end
end

def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :email, with: "test@test.com"
  fill_in :password, with: "12345"
  fill_in :confirm_password, with: "12345"
  click_button "Sign Up"
end
