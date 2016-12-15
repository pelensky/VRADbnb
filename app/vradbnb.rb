ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
# require_relative './models/listing.rb'
# require_relative './models/user.rb'
# require_relative './models/filter.rb'
require_relative 'data_mapper_setup'


class VRADBnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do

  end

  get '/users/new' do
    erb :'/signup'
  end

  post '/owner/new' do
    @owner = Owner.create(email: params[:email_o], password: params[:password_o], password_confirmation: params[:password_confirmation_o])
    if @owner.save
      session[:user_id] = @owner.id
      redirect '/listings'
    else
      flash.now[:errors] = @owner.errors.full_messages
      erb :'signup'
    end
  end

  post '/renter/new' do
    @renter = Renter.create(email: params[:email_r], password: params[:password_r], password_confirmation: params[:password_confirmation_r])
    if @renter.save
      session[:user_id] = @renter.id
      redirect '/listings'
    else
      flash.now[:errors] = @renter.errors.full_messages
      erb :'signup'
    end
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/listings')
    else
      flash[:notice] = "The email or password is incorrect"
      redirect to('/sessions/new')
    end
  end


  get '/listings/new' do
    erb :create_listing
  end

  post '/listings/new' do
    description = params[:description]
    listing = Listing.create(name: params[:name], description: description,
    price: params[:price], start_date: params[:start_date],
    end_date: params[:end_date], owner_id: session[:user_id])
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

  get '/sessions/new' do
    erb :login
  end

  post '/owner/sessions' do
    owner = Owner.authenticate(params[:email_o], params[:password_o])
    if owner
      session[:user_id] = owner.id
      redirect to('/listings')
    else
      flash[:notice] = "The email or password is incorrect"
      redirect to('/sessions/new')
    end
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

  post '/renter/sessions' do
    renter = Renter.authenticate(params[:email_r], params[:password_r])
    if renter
      session[:user_id] = renter.id
      redirect to('/listings')
    else
      flash[:notice] = "The email or password is incorrect"
      redirect to('/sessions/new')
    end
  end

  get '/sessions/delete' do
    session[:user_id] = nil
    flash.keep[:notice] = "Log out successful. See you soon!"
    redirect to '/listings'
  end


  post '/booking/:id' do
    listing = Listing.first(params[:id])
    book = Book.new(date: params[:date], renter: current_renter, listing: listing)
    redirect to('/listings')
  end

  post '/booking' do
    @listing = Listing.get(params[:hidden_listing])
    erb :booking
  end


  helpers do
    def current_owner
      @current_owner ||= Owner.get(session[:user_id])
    end

    def current_renter
      @current_renter ||= Renter.get(session[:user_id])
    end

    def current_listing
      @current_listing ||= Listing.get(session[:listing_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
