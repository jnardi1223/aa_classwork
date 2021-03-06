class BandsController < ApplicationController 
    
    def index 
        @bands = Band.all
        render :index 
    end 

    def show 
        @band = Band.find(params[:id])
        render :show
    end 

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else 
            render :new
        end 
    end 

    def new 
        @band = Band.new 
        render :new 
    end 

    def edit 
        @band = Band.find(params[:id])
        render :edit
    end 

    def update 
        @band = Band.find(params[:id])
        if @cat.update_attributes(band_params)
            redirect_to band_url(@band)
        else 
            render :new 
        end 
    end 

    def destroy 
        @band = @band.find(params[:id])
        @band.destroy 
        
    end

    private 

    def band_params 
        params.require(:band).permit(:name)
    end 
end