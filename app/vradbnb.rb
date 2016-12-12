require 'sinatra/base'

class VRADBnB < Sinatra::Base

  get '/' do

  end

  get '/signup' do

    erb :'/signup'
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], confirm_password: params[:confirm_password])
    redirect '/listings/new'
  end

  get '/listings/new' do
    erb :create_listing
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
