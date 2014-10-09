
get '/' do
  erb :welcome
end

post '/signup' do
  # This might be divided into '/log_in' and '/sign_up'
  redirect '/home'
end

post '/login' do

  redirect '/home'
end

get '/home' do
  erb :home_page
end

get '/profile/:id' do
  erb :profile
end

