helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
  def current_user
    @current_user || User.authenticate(session[:user_id])
  end

  def no_user_redirect
    redirect '/' if current_user.nil?
  end
end
