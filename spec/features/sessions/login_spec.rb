feature "Logging in" do

  scenario "user can sign in" do
    sign_up
    sign_in
    expect(page).to have_content "Aloha, test@test.com"
  end

  scenario "user can not sign in with incorrect password" do
    visit '/sessions/new'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'wrong'
    click_button "Sign In"
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario "user can not sign in if they are already signed it" do
    sign_up



  end



end
