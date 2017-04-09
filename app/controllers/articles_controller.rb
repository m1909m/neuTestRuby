class ArticlesController < ApplicationController
  respond_to :json
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    #  @events = CEvent.where(start: params[:start]..params[:end])
    #@c_events = CEvent.all
    respond_to do |format|
#      format.json { render json: CEvent.where(room_id: params[:roomid])}
    end
  end


  def show
    respond_to do |format|
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
    # TODO Tests
   # @c_event.userMail = current_user.email
    @article.save
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end



  def article_params
    params.require(:article).permit(:title, :price, :count, :site)
  end
end