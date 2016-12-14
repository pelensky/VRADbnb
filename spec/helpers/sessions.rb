module SessionHelpers

  def sign_up_o(email: "owner@test.com", password: "12345", password_confirmation: "12345" )
    visit '/users/new'
    fill_in :email_o, with: email
    fill_in :password_o, with: password
    fill_in :password_confirmation_o, with: password_confirmation
    click_button "Sign Up as an owner"
  end

  def sign_up_r(email: "renter@test.com", password: "12345", password_confirmation: "12345" )
    visit '/users/new'
    fill_in :email_r, with: email
    fill_in :password_r, with: password
    fill_in :password_confirmation_r, with: password_confirmation
    click_button "Sign Up as a renter"
  end

  def sign_in_o
    visit '/owner/sessions/new'
    fill_in :email_o, with: 'owner@test.com'
    fill_in :password_o, with: '12345'
    click_button "Sign in as an owner"
  end

  def sign_in_r
    visit '/renter/sessions/new'
    fill_in :email_r, with: 'renter@test.com'
    fill_in :password_r, with: '12345'
    click_button "Sign in as a renter"
  end

end
