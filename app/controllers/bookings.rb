class VRADBnB < Sinatra::Base
     post '/booking/new' do
      listing = Listing.get(params[:hidden_value])
      listing.requested = true
      book = Book.create(date: params[:date],
            renter: current_renter, listing: listing)
      redirect to('/booking/renter_history')
    end

    post '/booking' do
      @listing = Listing.get(params[:hidden_listing])
      erb :booking
    end

    get '/booking/renter_history' do
      @renter_history = Book.all(renter_id: current_renter.id)
      erb :renter_history
    end

    get '/booking/owner_history' do
      owner_history = Listing.all(owner_id: current_owner.id)
      @owner_requested_spaces = owner_history.all(requested: true)
      erb :owner_history
    end

end
