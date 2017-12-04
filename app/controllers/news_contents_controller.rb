class NewsContentsController < ApplicationController

  before_action :set_news_content, only: [:show, :edit, :update, :destroy]



  # GET /newsletters

  # GET /newsletters.json

  def index
    if current_user.present?

      @news_contents = NewsContent.order(created_at: :desc)
    else
      redirect_to "/users/sign_in"
    end

  #  @news_contents.sort_by{|e| e[:created_at]}

  #  @news_contents.reverse!

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

    @layout = Newsletter.find(@news_content.newsletter_id)
    I18n.locale = :de
    @news_content.save
    @jobId = SendEmailJob.set(wait_until: @news_content.sendtime.to_time - 1.hours).perform_later(@layout, @news_content)
    @news_content = NewsContent.find(@news_content.id)
    @news_content.jobid = Delayed::Job.last.id
    if @news_content.save








        #  NewsMailer.news_email(@layout, @news_content, @aboNewsletters).deliver

        #  @news = NewsContent.find(@news_content.id)
        #  @news.sendStatus = true
        #  @news.save

        respond_to do |f|
	        flash[:success] = 'Newsletter wurde erfolgreich erstellt.'
          f.html { redirect_to "/news_contents", success: 'Newsletter wurde erfolgreich erstellt.'}

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
        flash[:success] = 'Newsletter wurde erfolgreich geändert.'

        format.html { redirect_to "/news_contents", success: 'Newsletter wurde erfolgreich geändert.' }

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
    Delayed::Job.find(@news_content.jobid).destroy
    @news_content.destroy

    respond_to do |format|
      flash[:success] = 'Newsletter wurde erfolgreich gelöscht.'

      format.html { redirect_to "/news_contents", success: 'Newsletter wurde erfolgreich gelöscht.' }

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



