class ArtworksSharesController < ApplicationController
    def create
        artwork_share = ArtworksShare.new(artworks_share_params)
        if artwork_share.save
          render json: artwork_share
        else
          render json: artwork_share.errors.full_messages, status: :unprocessable_entity #422
        end 
    end

    def destroy
        @artwork_share = ArtworksShare.find_by(id: params[:id])
        @artwork_share.destroy  
        render json: @artwork_share
    end

    
    def artworks_share_params
        params.require(:artworks_shares).permit(:artwork_id, :viewer_id)
    end
end
