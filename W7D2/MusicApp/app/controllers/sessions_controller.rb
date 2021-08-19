class SessionsController < ApplicationController
    def new 
       @user = User.new 
       render :new  
    end 

    def create 
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if @user
            session[:session_token] = @user.reset_session_token!
            redirect_to user_url(@user)
        else
            render :new
        end 
    end 

    def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil 
    end
end 