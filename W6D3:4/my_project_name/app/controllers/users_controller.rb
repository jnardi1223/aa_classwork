class UsersController < ApplicationController





    def index 
        # render plain: "I'm in the index action!"
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            render json: @user
        else
            @users = User.all 
            render json: @users 
        end
        # render json: params
    end 

    def show 
        @user = User.find_by(id: params[:id])
        # @user = users.find(param[:id])
        # render json: @user 
        if @user
            render json: [@user, @user.artworks, @user.artwork_shares[0..params[:limit].to_i]]
        else 
            render json: {error: 'User does not exist'}
        end 
    end 

    def create 
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity #422
        end 
    end 

    # # def new

    # # end 

    # # def edit

    # # end 

    def update 
        # render json: params
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy 
        @user = User.find_by(id: params[:id])
        @user.destroy  
        redirect_to users_url 
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end


end 