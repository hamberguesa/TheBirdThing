get '/new_tweet' do
  no_user_redirect

  erb :new_tweet

end

post '/new_tweet' do
  no_user_redirect
  current_user.tweets.create(params)
  redirect "/home"
end

get '/edit_tweet/:id' do
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
    erb :edit_tweet
  else
    flash[:notice] = "You don't have permission to edit"
    redirect '/home'
  end
end

put '/edit_tweet/:id' do
  @tweet = Tweet.find(params[:id])
  if current_user.id == @tweet.user_id
    @tweet.update(content: params[:content])
    redirect '/:id'
  else
    flash[:notice] = "You don't have permission to edit"
    redirect '/home'
  end
end

delete '/:id' do
  @tweet = Tweet.find(params[:id])
  if current_user.id == @tweet.user_id
    @tweet.destroy
  else
    flash[:notice] = "You don't have permission to delete"
    redirect '/home'
  end
end

get '/:id' do
  @tweet = Tweet.find(params[:id])
end
