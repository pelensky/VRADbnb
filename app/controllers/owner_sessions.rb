class VRADBnB < Sinatra::Base

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

end
