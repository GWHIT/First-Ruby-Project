class CommentsController < ApplicationController
    http_basic_authenticate_with name: "Admin", password: "Admin", only: [:destroy, :index]
    def index
        @comments = Comment.all
    end
      
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def show
       @article = Article.find(params[:article_id])
       redirect_to article_path(@article)
    end
        
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
