class VRADBnB < Sinatra::Base

    post '/booking/new' do
      listing = Listing.get(params[:hidden_value])
      listing.requested = true
      book = Book.create(date: params[:date],
            renter: current_renter, listing: listing)
            # binding.pry
      redirect to('/booking/renter_history')
    end

    post '/booking' do
      @listing = Listing.get(params[:hidden_listing])
      erb :booking
    end

    get '/booking/renter_history' do
      @renter_history = Book.all(renter_id: current_renter.id)
      # binding.pry
      erb :renter_history
    end

    get '/booking/owner_history' do
      erb :owner_history
    end
end
