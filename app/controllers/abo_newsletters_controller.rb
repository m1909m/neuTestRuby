class AboNewslettersController < ApplicationController
  before_action :set_abo_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /abo_newsletters
  # GET /abo_newsletters.json
  def index
    @abo_newsletters = AboNewsletter.all
  end

  # GET /abo_newsletters/1
  # GET /abo_newsletters/1.json
  def show
  end

  # GET /abo_newsletters/new
  def new
    @abo_newsletter = AboNewsletter.new
  end

  # GET /abo_newsletters/1/edit
  def edit
  end

  # POST /abo_newsletters
  # POST /abo_newsletters.json
  def create
    @abo_newsletter = AboNewsletter.new(abo_newsletter_params)
    @abo_newsletter.enable = true

    respond_to do |format|
      if @abo_newsletter.save

        format.html { render :new, notice: 'Sie haben sich erfolgreich angemeldet.' }
        format.json { render :new, status: :created, location: AboNewsletter.new }
      else
        format.html { render :new }
        format.json { render json: @abo_newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abo_newsletters/1
  # PATCH/PUT /abo_newsletters/1.json
  def update
    respond_to do |format|
      if @abo_newsletter.update(abo_newsletter_params)
        format.html { redirect_to @abo_newsletter, notice: 'Abo newsletter was successfully updated.' }
        format.json { render :show, status: :ok, location: @abo_newsletter }
      else
        format.html { render :edit }
        format.json { render json: @abo_newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abo_newsletters/1
  # DELETE /abo_newsletters/1.json
  def destroy
    @abo_newsletter.destroy
    respond_to do |format|
      format.html { redirect_to @abo_newsletters_url, notice: 'Abo newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Get /abo_newsletter/email/signOut
  def signOutNews
    @abo_newsletter = AboNewsletter.find(params[:email])
    @abo_newsletter.enable = false
    respond_to do |format|
      if @abo_newsletter.save
        format.html { redirect_to @abo_newsletter, notice: 'Abo fürs Newsletter wurde erfolgreich abgemeldet.' }
        format.json { render :signOutNews, status: :created, location: @abo_newsletter }
      else
        format.html { render :new }
        format.json { render json: @abo_newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abo_newsletter
      @abo_newsletter = AboNewsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abo_newsletter_params
      params.require(:abo_newsletter).permit(:eMail, :enable)
    end
end
