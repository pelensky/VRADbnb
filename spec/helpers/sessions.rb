module SessionHelpers

  def sign_up(email: "test@test.com", password: "12345", password_confirmation: "12345" )
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign Up"
  end

  def sign_in
    visit '/sessions/new'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: '12345'
    click_button "Sign In"
  end

end
