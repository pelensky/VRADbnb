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
    click_button('Book')
    fill_in "date", with: "25/12/2016"
    click_button("submit")
  end
end
