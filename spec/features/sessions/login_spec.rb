feature "Logging in" do



  scenario "owner can not sign in with incorrect password" do
    visit '/sessions/new'
    fill_in :email_o, with: 'owner@test.com'
    fill_in :password_o, with: 'wrong'
    click_button "Sign in as an owner"
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario "renter can not sign in with incorrect password" do
    visit '/sessions/new'
    fill_in :email_r, with: 'renter@test.com'
    fill_in :password_r, with: 'wrong'
    click_button "Sign in as a renter"
    expect(page).to have_content "The email or password is incorrect"
  end

end
