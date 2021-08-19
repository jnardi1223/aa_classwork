class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?
    
    def current_user #find user whos session token is current session token 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def require_logged_in 
        redirect_to new_session_url unless logged_in?  
    end 

    def require_logged_out 
        redirect_to users_url if logged_in? 
    end 

    def login(user) #reset their session token to the current session token 
        session[:session_token] = user.reset_session_token!
        # matches up session's token with user's new token 
    end 

    def logged_in?
        !!current_user #we alwasy get back true or false 
    end 

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil 
        current_user = nil
    end 
end
