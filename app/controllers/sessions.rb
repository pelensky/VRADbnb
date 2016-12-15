class VRADBnB < Sinatra::Base

get '/' do
  erb :login
end

  get '/users/new' do
    erb :'/signup'
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

  get '/sessions/delete' do
    session[:user_id] = nil
    flash.keep[:notice] = "Log out successful. See you soon!"
    redirect to '/listings'
  end

  get '/sessions/new' do
    erb :login
  end

end
