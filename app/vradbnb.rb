require 'sinatra/base'

class VRADBnB < Sinatra::Base
  get '/' do
    'Hello VRADBnB!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
