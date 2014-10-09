
get '/' do
  if User.find(session[:user_id]).nil?
    erb :welcome
  else
    redirect '/home'
  end
end


post '/signup' do
  if params[:password] == params[:verify_password]
    @user = User.create({
      name: params[:name],
      username: params[:username],
      password: params[:password],
      email: params[:email]
    })
  else
    #set error in flash
    flash[:notice] = "Passwords do not match"
    redirect '/'
  end
  if @user.id.nil?
    #set error in flash
    flash[:notice] = "Username or Email already taken"
    redirect '/'
  else
    session[:user_id] = @user.id
    redirect '/home'
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/login' do

  redirect '/home'
end

get '/home' do
  @user = User.find(session[:user_id])
  if @user.nil?
    redirect '/'
  else
    erb :home_page
  end
end

get '/profile/:id' do
  @profile = User.find(params[:id])
  erb :profile
end

