class ArtworksController < ApplicationController
    def index 
        # @artworks = Artwork.all 
        # render json: @artworks 
        if params[:artwor][:id]
            a = Artwork.find_by(id: params[:id])
            u = a.artist
            s = a.shared_viewers
            render json: [u, s]
        else 
           @artworks = Artwork.all 
           render json: @artworks 
        end 

    end 

    def show 
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork
            render json: @artwork
        else 
            render json: {error: 'artwork does not exist'}
        end 
    end 

    def create 
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity #422
        end 
    end 

    def update 
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.update(artwork_params)
        render json: @artwork
    end

    def destroy 
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy  
        redirect_to artworks_url 
    end 

    private

    def artwork_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end
end
