

get '/new_tweet' do
  @user = User.find(session[:user_id])
  if @user.nil?
    redirect '/'
  else
    erb :new_tweet
  end
end


post '/new_tweet' do
  @user = User.find(session[:user_id])
  if @user.nil?
    redirect '/'
  else
    @user.tweets.create(params)
    redirect "/#{@user.tweets.last.id}"
  end
end

get '/edit_tweet/:id' do
  erb :edit_tweet
end

put '/edit_tweet/:id' do
  @user = User.find(session[:user_id])
  @tweet = Tweet.find(params[:id])
  if @user.id == @tweet.user_id
    @tweet.update(content: params[:content])
    redirect '/:id'
  else
    # give permision error
  end
end

delete '/:id' do
  @user = User.find(session[:user_id])
  @tweet = Tweet.find(params[:id])
  if @user.id == @tweet.user_id
    @tweet.destroy
  else
    # give permision error
  end
end

get '/:id' do
  @tweet = Tweet.find(params[:id])
end
