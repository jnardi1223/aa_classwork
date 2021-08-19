class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render json: { error: 'Could\'nt find user' }, status: 404
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      #login
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
