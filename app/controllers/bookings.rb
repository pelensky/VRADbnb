class VRADBnB < Sinatra::Base

    post '/booking/new' do
      listing = Listing.get(params[:hidden_value])
      book = Book.create(date: params[:date],
            renter: current_renter, listing: listing)
            # binding.pry
      redirect to('/booking/history')
    end

    post '/booking' do
      @listing = Listing.get(params[:hidden_listing])
      erb :booking
    end

    get '/booking/history' do
      @renter_history = Book.all(renter_id: current_renter.id)
      # binding.pry
      erb :history
    end
end
