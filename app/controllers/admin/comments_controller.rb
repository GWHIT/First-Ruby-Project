class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    
        @comments = Comment.all.paginate(page: params[:page], per_page: 5)
    end
    
    def destroy
        
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to admin_comments_path
    end
        
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
