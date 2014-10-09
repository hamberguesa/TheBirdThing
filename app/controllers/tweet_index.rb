

get '/new_tweet' do
  erb :new_tweet
end

post '/new_tweet' do
  # Tweets need to know who authors them.
end

get '/edit_tweet/:id' do
  erb :edit_tweet
end

put '/edit_tweet/:id' do

  redirect '/profile/:id'
end

delete '/delete_tweet' do
end
