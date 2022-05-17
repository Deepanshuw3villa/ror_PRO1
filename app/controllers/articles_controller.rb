class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @showarticle = Article.find(params[:id])
  end

  def new
    @newarticle = Article.new
  end

  def create
    @savearticle = Article.new(article_params)
    if @savearticle.save
       redirect_to articles_path
      else
       render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @editarticle = Article.find(params[:id])
  end

  def update
    @updatearticle = Article.find(params[:id])

    if @updatearticle.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deletearticle = Article.find(params[:id])
    @deletearticle.destroy
    redirect_to root_path, status: :see_other

  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :category_id)
    end
end
