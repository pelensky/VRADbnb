ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/listing.rb'
require_relative './models/user.rb'

class VRADBnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do

  end

  get '/signup' do

    erb :'/signup'
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    user.save
    session[:user_id] = user.id
    redirect '/listings/new'
  end

  get '/listings/new' do
    erb :create_listing
  end

  post '/listings' do
    description = params[:description]
    listing = Listing.create(name: params[:name], description: description,
              price: params[:price], start_date: params[:start_date],
              end_date: params[:end_date])
    listing.save
    redirect '/listings'
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
