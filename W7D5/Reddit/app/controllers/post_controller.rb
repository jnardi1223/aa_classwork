class PostsController < ApplicationController
  def new 
    @post = Post.new 
    render :new 
  end

  def create 
    @post = Post.new(post_params)
    if @post.save 
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = ['Missing Parameters']
      render :new 
    end
  end

  def edit 
    if @post.author_id == current_user.id
      @post = Post.find_by(id: params[:id]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  )
      render :edit 
    else
      flash.now[:errors] = ['Invalid AUthor'] 
    end    
  end

  def update 
    @post = Post.find_by(id: params[:id])
    if @post.author_id == current_user.id 
      if @post.update(post_params)
        redirect_to post_url(@post)
      else 
        flash.now[:errors] = ['Invalid Post']
      end 
    else
      flash.now[:errors] = ['Invalid AUthor'] 
    end
  end

  def show 
    @post = Post.find_by(id: params[:id])
    if @post 
      render :show 
    else 
      flash.now[:errors] = ['Post is not exist']
    end
  end

  def destroy 
    @post = Post.find_by(id: params[:id])
      if @post 
        @post.destroy 
        render :index 
      else 
        flash.now[:errors] = ['Post is not available']
      end    
  end

  private
  def post_params
    params.require(:post).permit(:title,:url, :sub, :user_id, :content)
  end
end