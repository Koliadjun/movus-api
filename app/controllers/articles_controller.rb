class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created, location: @article
      else
      render json: @article.errors, status: :unprocessable_entity       
    end
  end
  def destroy
    @articleToDesrtoy = Article.find(params[:id]).destroy
    render json: @articleToDesrtoy
  end
  def show
    @articleToShow = Article.find(params[:id])
    render json: @articleToShow
  end
  def update
    @articleToUpdade = Article.find(params[:id])
    if @articleToUpdade.update(article_params)
      render json: @articleToUpdade    
    else
      render json: @articleToUpdade.errors
    end
  end
  private
    def article_params
      params.require(:article).permit!
    end
end
