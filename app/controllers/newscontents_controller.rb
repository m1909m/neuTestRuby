class NewscontentsController < ApplicationController
  before_action :set_newscontent, only: [:show, :edit, :update, :destroy]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newscontents = Newscontent.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @newscontent = Newscontent.new
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1/edit
  def edit
    @newscontent = Newscontent.find(params[:id])
    @newsletters = Newsletter.all
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newscontent = Newscontent.new(newscontent_params)

    respond_to do |format|
      if @newscontent.save
        format.html { redirect_to action: "index" }
      #  format.json { render :show, status: :created, location: @newscontent }
      else
        format.html { render :new }
        format.json { render json: @newscontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    respond_to do |format|
      if @newscontent.update(newsletter_params)
        format.html { redirect_to @newscontent, notice: 'Newsletter wurde erfolgreich geändert' }
        format.json { render :show, status: :ok, location: @newscontent }
      else
        format.html { render :edit }
        format.json { render json: @newscontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newscontent.destroy
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
  def set_newscontent
    @newscontent = Newscontent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def newscontent_params
    params.require(:newscontent).permit(:content, :sendtime, :newsletter_id)
  end
end
