feature "signup" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_current_path('/listings/new')
  end

  scenario "a user should be added to the Data Base" do
    user = User.all
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario "requires a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end

def sign_up(email: "test@test.com", password: "12345", password_confirmation: "12345" )
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end