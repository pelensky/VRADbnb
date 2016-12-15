class VRADBnB < Sinatra::Base

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

end
