class CommentsController < ApplicationController
  before_filter :load_article
    
  def create
    @comment = @article.comments.create(params[:comment])
        
    if @comment.save
      redirect_to @article, :notice => 'Thanks for your comment'
    else
      @comment.destroy
      render "articles/show"
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted'
  end
  
  private
  
    def load_article
      @article = Article.find(params[:article_id])
    end
  
end
