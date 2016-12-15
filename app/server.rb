class VRADBnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

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

  run! if app_file == $0
end
