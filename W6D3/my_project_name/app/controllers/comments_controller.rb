class CommentsController < ApplicationController
    
    def index 
        if params[:id]
            if self.class == User 
                user = User.find(id: params[:id])
                render json: user.comments 
            elsif self.class == Artwork 
                artwork = Artwork.find(id: params[:id])
                render json: artwork.comments 
            end 
        else 
            @comments = Comment.all 
            render json: @comments 
        end 
    end 
    
    def create
        comment = Comment.new(comment_params)
        if comment.save
          render json: comment
        else
          render json: comment.errors.full_messages, status: :unprocessable_entity #422
        end 
    end 

    def destroy 
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy  
        redirect_to comments_url 
    end 

    private 


    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
