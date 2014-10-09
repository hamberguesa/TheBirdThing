

get '/profile/:id/new_tweet' do
  erb :new_tweet
end

post '/profile/:id/new_tweet' do
  # Tweets need to know who authors them.
end

get '/profile/:id/edit_tweet' do
  erb :edit_tweet
end

put '/profile/:id/edit_tweet' do
  redirect '/profile/:id'
end

delete '/profile/delete_tweet' do
end
