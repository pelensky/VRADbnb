feature "bookinging a space" do

  scenario "user books crack house for 15/12/2016" do
    expect{ book_a_place }.to change(Book, :count).by(1)
    expect(current_path).to eq('/listings')
  end

  def book_a_place
    sign_up_o
    new_listing
    click_link("Log Out")
    sign_up_r
    expect(current_path).to eq('/listings')
<<<<<<< HEAD:spec/features/requests/requesting_a_space_spec.rb
    click_button('Request')
    expect(page).to have_content "Requests"
=======
    click_button('Book')
>>>>>>> da0851c0e55ca0e451258562024577a57d3252b1:spec/features/requests/booking_a_space_spec.rb
    fill_in "date", with: "25/12/2016"
    click_button("submit")
  end
end
