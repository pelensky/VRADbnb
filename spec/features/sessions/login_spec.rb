feature "Logging in" do

  scenario "owner can sign in" do
    sign_up_o
    sign_in_o
    expect(page).to have_content "Aloha, owner@test.com"
  end

  scenario "renter can sign in" do
    sign_up_r
    sign_in_r
    expect(page).to have_content "Aloha, renter@test.com"
  end

  scenario "owner can not sign in with incorrect password" do
    visit '/owner/sessions/new'
    fill_in :email_o, with: 'owner@test.com'
    fill_in :password_o, with: 'wrong'
    click_button "Sign In as an Owner"
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario "renter can not sign in with incorrect password" do
    visit '/renter/sessions/new'
    fill_in :email_r, with: 'renter@test.com'
    fill_in :password_r, with: 'wrong'
    click_button "Sign In as a Renter"
    expect(page).to have_content "The email or password is incorrect"
  end

end
