class NewsContentsController < ApplicationController
  before_action :set_news_content, only: [:show, :edit, :update, :destroy]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @news_contents = NewsContent.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @news_content = NewsContent.new
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1/edit
  def edit
    @id = params[:id]
    @news_content = NewsContent.find(params[:id])
    @newsletters = Newsletter.all
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @news_content = NewsContent.new(news_content_params)

    @news_content.sendStatus = false

    if @news_content.save
      @layout = Newsletter.find(@news_content.newsletter_id)
      SendEmailJob.set(wait_until: @news_content.sendTime).perform_later(@layout, @news_content)
      respond_to do |f|
        f.html { redirect_to news_contents_url, notice: 'News wurde erfolgreich erstellt'}
      end
    else

    end

  end

  def setSend

  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    respond_to do |format|
      if @news_content.update(news_content_params)
        format.html { redirect_to @news_content, notice: 'Newsletter wurde erfolgreich geändert' }
        format.json { render :show, status: :ok, location: @news_content }
      else
        format.html { render :edit }
        format.json { render json: @news_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @news_content.destroy
    respond_to do |format|
      format.html { redirect_to news_contents_url, notice: 'Newsletter wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def sendNewsletter
    NewsMailer.news_email(Newsletter.last).deliver
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news_content
    @news_content = NewsContent.find(params[:id])
  end
    def news_content_params
      params.require(:news_content).permit(:title, :content, :sendtime, :newsletter_id)
    end
end

