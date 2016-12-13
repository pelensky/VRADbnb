feature "Creating a new listing" do

  scenario "Owner submits a listing for their space" do
    sign_up
    new_listing
    expect(page).to have_current_path('/listings')
    expect(page).to have_content("Sunny palace")
  end

  scenario "Owner attempts to submit a listing without a name" do
    new_listing(name:"")
    expect(page).to have_content("Name must not be blank")
  end

  scenario "Owner attempts to submit a listing without a description" do
    new_listing(description:"")
    expect(page).to have_content("Description must not be blank")
  end

  scenario "Owner attempts to submit a listing without a price" do
    new_listing(price:"")
    expect(page).to have_content("Price must not be blank")
  end

  scenario "Owner attempts to submit a listing without a start date" do
    new_listing(start_date:"")
    expect(page).to have_content("Start date must not be blank")
  end

  scenario "Owner attempts to submit a listing without an end date" do
    new_listing(end_date:"")
    expect(page).to have_content("End date must not be blank")
  end

  scenario "Owner attempts to submit a listing with letters for price" do
    new_listing(price:"fourteen")
    expect(page).to have_content("Price must be an integer")
  end

  scenario "Owner attempts to submit a listing with incorrect start date format" do
    new_listing(start_date:"now")
    expect(page).to have_content("Please enter start date in correct format")
  end

  scenario "Owner attempts to submit a listing with incorrect end date format" do
    new_listing(start_date:"now")
    expect(page).to have_content("Please enter start date in correct format")
  end



end
