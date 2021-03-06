class VRADBnB < Sinatra::Base

  get '/listings/new' do
    erb :create_listing
  end

  post '/listings/new' do
    description = params[:description]
    listing = Listing.create(name: params[:name], description: description,
    price: params[:price], start_date: params[:start_date],
    end_date: params[:end_date], owner_id: session[:owner_id])
    if listing.save
      redirect '/listings'
    else
      flash.now[:errors] = listing.errors.full_messages
      erb :create_listing
    end
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    renter_start_date = params[:start_date]
    renter_end_date = params[:end_date]
    if renter_start_date && renter_end_date
      filter = Filter.new(renter_start_date, renter_end_date)
      @listings = filter.filter_spaces
    else
      @listings = Listing.all
    end
    erb :listings
  end

  get '/listings/my_listings' do
    if current_owner
      @my_listings = Listing.all(owner: current_owner)
      erb :my_listings
    else
      flash[:notice] = "You are not a owner, please make an owner account"
      redirect 'listings'
    end
  end

end
