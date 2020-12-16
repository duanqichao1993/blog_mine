class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @all_article = Article.all
  end

  #  /articles/:id(.:format)
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])

  end

  def create
    # 这里应该把数据保存到数据库中。
    #  params: [:article] 获取请求中的article
    @article = Article.new(article_param)
    save_success = @article.save
    if save_success
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_param)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article_find = Article.find(params[:id])
    @article_find.destroy
    redirect_to articles_path
  end
end



#  参数验证

private

def article_param
  params.require(:article).permit(:title, :text)
end
