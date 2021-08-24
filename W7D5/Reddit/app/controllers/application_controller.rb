class ApplicationController < ActionController::Base
  def current_user 
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to users_url if logged_in?
  end


  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in? # ture or false
    !!current_user # not not true or not not false
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end

end
