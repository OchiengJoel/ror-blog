class ArticlesController < ApplicationController

  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  #http_basic_authenticate_with name: "dhh", password: "secret", only: [:destroy, :create, :edit]
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    
  end

  def new
    @article = Article.new
    
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      flash.notice = "Created Post Successfully"
      redirect_to articles_path
      
      
    else
      render :new, status: :unprocessable_entity
      
    end
    
  end

  def edit

    @article = Article.find(params[:id])
    
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash.notice = "Post Edited Successfully"
      redirect_to articles_path
      
    else

      render :edit, status: :unprocessable_entity

    end
  end

  def destroy

    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article Deleted Successfully"
    redirect_to articles_path, status: :see_other

    
  end
  

  private

  def article_params

    params.require(:article).permit(:title, :content, :status)
    
  end
end
