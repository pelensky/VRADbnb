module SignupHelpers

  def sign_up(email: "test@test.com", password: "12345", password_confirmation: "12345" )
    visit '/signup'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign Up"
  end
  
end