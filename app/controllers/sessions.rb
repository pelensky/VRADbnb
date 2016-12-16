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


  get '/sessions/delete' do
    session[:user_id] = nil
    flash.keep[:notice] = "Log out successful. See you soon!"
    redirect to '/listings'
  end


end
