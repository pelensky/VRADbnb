module BookingHelpers

  def book_a_place
    sign_up_o
    new_listing
    click_link("Log Out")
    sign_up_r
    click_button('Book')
    fill_in "date", with: "25/12/2016"
    click_button("submit")
  end

end
