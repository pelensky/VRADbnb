class VRADBnB < Sinatra::Base

    post '/booking/:id' do
      listing = Listing.first(params[:id])
      book = Book.create(date: params[:date], renter: current_renter, listing: listing)
      redirect to('/listings')
    end

    post '/booking' do
      @listing = Listing.get(params[:hidden_listing])
      erb :booking
    end

    get '/booking/:renter_id' do
      @renter_history = Book.all(:renter_id => params[:renter_id])
      binding.pry
      erb :history
    end
end
