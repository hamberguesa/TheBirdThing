get '/new_tweet' do
  if current_user.nil?
    redirect '/'
  else
    erb :new_tweet
  end
end

post '/new_tweet' do
  if current_user.nil?
    redirect '/'
  else
    current_user.tweets.create(params)
    redirect "/home"
  end
end

get '/edit_tweet/:id' do
  erb :edit_tweet
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
