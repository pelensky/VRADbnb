feature "Creating a new listing" do

  scenario "Owner submits a listing for their space" do
    new_listing
    expect(page).to have_current_path('/listings')
    expect(page).to have_content("Sunny palace")
  end

  scenario "Owner submits a listing without a name" do
    new_listing(name:"")
    expect(page).to have_content("Name must not be blank")
  end

  scenario "Owner submits a listing without a description" do
    new_listing(description:"")
    expect(page).to have_content("Description must not be blank")
  end

end
