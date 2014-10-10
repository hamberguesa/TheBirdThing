get '/' do
  if current_user.nil?
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
  @user = User.find_by_username(params[:username])
  if !@user.nil? && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/home'
  else
    flash[:notice] = "Login failed"
    redirect '/'
  end
end

get '/home' do
  no_user_redirect
  erb :home
end

get '/profile/:id' do
  @profile = User.find(params[:id])
  erb :profile
end

