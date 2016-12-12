ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/listing.rb'

class VRADBnB < Sinatra::Base
  get '/' do
    'Hello VRADBnB!'
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
  # start the server if ruby file executed directly
  run! if app_file == $0
end
