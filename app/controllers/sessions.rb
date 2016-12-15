class VRADBnB < Sinatra::Base

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

  get '/sessions/new' do
    erb :login
  end

end
