class VRADBnB < Sinatra::Base

    post '/booking/:id' do
      listing = Listing.first(params[:id])
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
      erb :history
    end
end
