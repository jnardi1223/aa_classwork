class CommentsController < ApplicationController
    
    def index 
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            render json: user.comments 
        elsif params[:artwork_id]
            artwork = Artwork.find(id: params[:artwork_id])
            render json: artwork.comments  
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

# params = {id: 1, }
# three ways to get params
# 1) wildcard (:id)
# 2) query string (?)
# 3) body