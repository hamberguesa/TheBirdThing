helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
  def current_user
    @current_user || User.authenticate(session[:id])
  end
end
