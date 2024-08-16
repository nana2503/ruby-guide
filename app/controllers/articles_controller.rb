class ArticlesController < ApplicationController
  #/article
  def index
    @articles = Article.all
  end
  #/article/:id
  def show
    @article = Article.find(params[:id])
  end
  #/article
  def new
    @article = Article.new
  end
  #/create
  def create 
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else 
      render :new, status: :unprocessable_entity
    end
  end
  #edit
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end

  end
  #destroy
  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end
  #private params
  private 
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
