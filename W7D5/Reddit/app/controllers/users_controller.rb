class UserController < ApplicationController 
    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = ['empty fields']
            render :new
        end 
    end 

    def index 
        @users = User.all
        render :index 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        if @user 
            render :show 
        else 
            flash.now[:errors] = ['Name is not found']
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end 