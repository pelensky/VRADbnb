feature "Creating a new listing" do

  scenario "Owner submits a listing for their space" do
    visit '/listing/new'

    fill_in('name', with: 'Russel')
    fill_in('description', with: "Sunny palace")
    fill_in('price', with: 5000)
    fill_in('start_date', with: '31/01/2016')
    fill_in('end_date', with: '01/01/2017')
    click_button('listing')
    expect(page).to have_current_path('/listings')
    expect(page).to have_content("Sunny palace")
  end
end
