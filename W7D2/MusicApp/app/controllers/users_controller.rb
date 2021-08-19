class UsersController < ApplicationController 
    def new 
        @user = User.new 
        render :new 
    end 

    def show 
        @user = User.find(params[:id])
        render :show 
    end 

    def create
        @user = User.new(user_params)
    
        if @user.save!
          login(@user)
          redirect_to users_url
        else
          render :new
        end
    end

   

    private 

    def user_params 
        params.require(:user).permit(:email, :password)
    end 

end 