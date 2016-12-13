ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class VRADBnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do

  end

  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/listings/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end

  get '/listings/new' do
    erb :create_listing
  end

  post '/listings' do
    description = params[:description]
    listing = Listing.create(name: params[:name], description: description,
    price: params[:price], start_date: params[:start_date],
    end_date: params[:end_date], user_id: session[:user_id])
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

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/listings')
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      redirect to('/sessions/new')
    end
  end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end
    # start the server if ruby file executed directly
    run! if app_file == $0
  end
