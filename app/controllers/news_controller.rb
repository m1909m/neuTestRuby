class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.last(12)

    #@news.sort_by{|e| -e[:created_at]}
    @news.reverse!
  end

  def admin
    @news = News.last(20)
    @news.reverse!
  end

  def archiv
    @news = News.last(40)
    @news.reverse!
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
        flash[:success] = 'News wurde erfolgreich gespeichert'
        format.html { redirect_to @news }
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
        flash[:success] = 'News wurde erfolgreich aktualisiert'
        format.html { redirect_to @news }
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
      flash[:error] = 'News wurde erfolgreich entfernt'
      format.html { redirect_to news_url }
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
