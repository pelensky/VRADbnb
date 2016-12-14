feature "signup" do
  scenario "owner can sign up" do
    sign_up_o
    expect(current_path).to eq('/owner/sessions/new')
  end

  scenario "renter can sign up" do
    sign_up_r
    expect(current_path).to eq('/renter/sessions/new')
  end

  scenario "an owner should be added to the Data Base" do
    expect{ sign_up_o }.to change(Owner, :count).by(1)
  end

  scenario "a renter should be added to the Data Base" do
    expect{ sign_up_r }.to change(Renter, :count).by(1)
  end

  scenario "requires a matching confirmation password" do
    expect { sign_up_o(password_confirmation: 'wrong') }.not_to change(Owner, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "requires a matching confirmation password" do
    expect { sign_up_r(password_confirmation: 'wrong') }.not_to change(Renter, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "a user needs to input an email address" do
    expect {sign_up_o(email: nil)}.not_to change(Owner, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario "a user needs to input a valid format of email address" do
    expect {sign_up_r(email: "invalid@email")}.not_to change(Renter, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "a user can not sign up with an existing email" do
    sign_up_o
    expect {sign_up_o}. not_to change(Owner, :count)
    expect(page).to have_content("Email is already taken")
  end

end
