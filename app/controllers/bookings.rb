class VRADBnB < Sinatra::Base
     post '/booking/new' do
      listing = Listing.get(params[:hidden_value])
      listing.requested = true
      listing.save
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
      requested = owner_history.all(requested: true)
      @owner_bookings = []
      requested.each {|listing| @owner_bookings<< Book.first(listing_id: listing.id)}
      erb :owner_history
    end

    post '/booking/confirm' do
      booking = Book.first(id: params[:booking_id])
      booking.confirmed = true
      booking.save
      redirect '/booking/owner_history'
    end
end
