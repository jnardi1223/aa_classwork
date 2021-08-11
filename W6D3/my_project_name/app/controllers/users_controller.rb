class UsersController < ApplicationController





    def index 
        render plain: "I'm in the index action!"
    #     @users = users.all 
    #     render json: @users 
    end 

    # def show 
    #     @user = users.find_by(id: param[:id])
    #     # @user = users.find(param[:id])
    #     # render json: @user 
    #     if @user
    #         render json: @user
    #     else 
    #         render json: {error: 'User does not exist'}
    #     end 
    # end 

    # def create 
    #     @user = user.new() 
    # end 

    # # def new

    # # end 

    # # def edit

    # # end 

    # def update 

    # end

    # def destroy 
    #     @user = users.find_by(id: param[:id])
    #     @user.destroy  
    #     redirect_to users_url 
    # end 

    # private

    # def user_params
    #     params.require(:user).permit()


end 