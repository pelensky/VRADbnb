class VRADBnB < Sinatra::Base

    post '/booking/:id' do
      listing = Listing.first(params[:id])
      listing.requested = true
      book = Book.create(date: params[:date],
            renter: current_renter, listing: listing)
      redirect to('/booking/history')
    end

    post '/booking' do
      @listing = Listing.get(params[:hidden_listing])
      erb :booking
    end

    get '/booking/history' do
        @renter_history = Book.all(renter_id: current_renter.id)
        erb :renter_history



    end

    get '/booking/history/owner' do
      binding.pry
      owner_history = Book.all(listing_id: current_owner.listings)
      @owner_requested_spaces = owner_history.all(requested: true)
      erb :owner_history
    end
end
