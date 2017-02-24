class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.last(12)
    @news.sort_by{|e| -e[:created_at]}

  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News wurde erfolgreich gespeichert' }
        format.json { render :index, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News wurde erfolgreich aktualisiert' }
        format.json { render :index, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_url, notice: 'News wurde erfolgreich entfernt' }
      format.json { head :no_content }
    end
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :subTitle, :story, :sendDate)
    end
end
