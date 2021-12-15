class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end
    
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        @comment = @post.comments.create(params[:comment].permit(:user_id,:name, :comment ))
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to post_path(@post)
        end
        
    end
    
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    
end
