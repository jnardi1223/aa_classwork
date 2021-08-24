class SubsController < ApplicationController 
    def new 
      @sub = Sub.new 
      render :new 
    end

    def index 
      @subs = Sub.all 
      render :index 
    end

    def show 
      @sub = Sub.find_by(id: params[:id])
      render :show
    end

    def create 
      @sub = Sub.new(sub_params)
      if @sub.save 
        redirect_to sub_url(@sub)
      else 
        flash.now[:errors] = ['Invalid Parameter']
        render :new
      end
    end

    def edit 
      @sub = Sub.find_by(id: params[:id])
      render :edit 
    end

    def update 
      @sub = Sub.find_by(id: params[:id])
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else 
        flash.now[:errors] = ['Invalid Sub']
      end
    end

    def destroy 
      @sub = Sub.find_by(id: params[:id])
      if @sub 
        @sub.destroy 
        render :index 
      else 
        flash.now[:errors] = ['Sub is not available']
      end
    end

    private 
    def sub_params
      params.require(:sub).permit(:title, :content, :user_id)
    end
end 