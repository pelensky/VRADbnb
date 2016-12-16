class VRADBnB < Sinatra::Base
  use Rack::MethodOverride
  use Rack::Session::Cookie,  :expire_after => 3600,
                              :secret => 'super secret'

  register Sinatra::Flash

  helpers do
    def current_owner
      @current_owner ||= Owner.get(session[:owner_id])
    end

    def current_renter
      @current_renter ||= Renter.get(session[:renter_id])
    end

    def current_listing
      @current_listing ||= Listing.get(session[:listing_id])
    end
  end

  run! if app_file == $0
end
