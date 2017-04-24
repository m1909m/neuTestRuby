class ArticlesController < ApplicationController
  respond_to :json
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.where(site: "batkf")
    respond_to do |f|
      f.html
    end
  end


  def show
    respond_to do |format|
      format.html
 #     format.json { render json: Member.where( event_id: params[:id]) }
    end
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.site = "batkf"
    # TODO Tests
   # @c_event.userMail = current_user.email
    @article.save
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artikel wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end



  def article_params
    params.require(:article).permit(:title, :price, :count)
  end
end