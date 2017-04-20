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
    @news_content = NewsContent.find(params[:id])
    @newsletters = Newsletter.all
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @news_content = NewsContent.new(news_content_params)
    puts(@news_content)

    @news_content.send = false

  #  respond_to do |format|
      if @news_content.save
       # format.html { redirect_to action: "index" }
        #  format.json { render :show, status: :created, location: @newscontent }
      else
        #format.html { render :new }
        #format.json { render json: @news_content.errors, status: :unprocessable_entity }
      end
 #   end
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
      format.html { redirect_to newscontents_url, notice: 'Newsletter wurde erfolgreich gelöscht.' }
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

