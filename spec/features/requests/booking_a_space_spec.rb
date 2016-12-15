feature "bookinging a space" do

  scenario "user books crack house for 15/12/2016" do
    expect{ book_a_place }.to change(Book, :count).by(1)
    expect(current_path).to eq('/listings')
  end
end
