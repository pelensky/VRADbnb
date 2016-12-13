feature "signup" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_content "Aloha, test@test.com"
    expect(page).to have_current_path('/listings/new')
  end

  scenario "a user should be added to the Data Base" do
    user = User.all
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario "requires a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "a user needs to input an email address" do
    expect {sign_up(email: nil)}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario "a user needs to input a valid format of email address" do
    expect {sign_up(email: "invalid@email")}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

scenario "a user can not sign up with an existing email" do
  sign_up
  expect {sign_up}. not_to change(User, :count)
  expect(page).to have_content("Email is already taken")
end

end
