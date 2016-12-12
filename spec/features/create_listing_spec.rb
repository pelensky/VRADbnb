feature "Creating a new listing" do

  scenario "Owner submits a listing for their space" dor
    new_listing
    expect(page).to have_current_path('/listings')
    expect(page).to have_content("Sunny palace")
  end

end
