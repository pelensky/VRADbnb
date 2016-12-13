feature "login" do

  scenario "user can sign in" do
    sign_up
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: '12345'
    click_button "Sign In"
    expect(page).to have_content "Aloha, test@test.com"
  end

  scenario "user can not sign in with incorrect password" do
    visit '/sessions/new'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'wrong'
    click_button "Sign In"
    expect(page).to have_content "The email or password is incorrect"
  end



end
