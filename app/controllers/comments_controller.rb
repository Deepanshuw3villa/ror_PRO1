class CommentsController < ApplicationController

  def create
    @showarticle = Article.find(params[:article_id])
    @createcomment = @showarticle.comments.create(comment_params)
    redirect_to article_path(@showarticle)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end

