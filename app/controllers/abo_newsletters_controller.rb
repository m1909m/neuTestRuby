class AboNewslettersController < ApplicationController

  before_action :set_abo_newsletter, only: [:show, :edit, :update, :destroy]



  # GET /abo_newsletters

  # GET /abo_newsletters.json

  def index

    @abo_newsletters = AboNewsletter.all.order(eMail: :asc)

    @abo_newsletter = AboNewsletter.new

  end



  # GET /abo_newsletters/1

  # GET /abo_newsletters/1.json

  def show

  end



  # GET /abo_newsletters/new

  def new

    @abo_newsletter = AboNewsletter.new

    @newsletter = NewsContent.where(sendStatus: true).order(sendtime: :desc)

  end



  # GET /abo_newsletters/1/edit

  def edit

  end



  # POST /abo_newsletters

  # POST /abo_newsletters.json

  def create

    @abo_newsletter = AboNewsletter.new(abo_newsletter_params)

    @abo_newsletter.enable = false



    respond_to do |format|

      if @abo_newsletter.save

        # TODOO Email link zum anmelden

        NewsMailer.anmelden_email(@abo_newsletter).deliver

        flash[:notice] = 'Bitte best&auml;tigen Sie in der kommenden Mail Ihre Identit&auml;t.'

        format.html { redirect_to "/abo_newsletters/new" }

      else

        flash[:error] = 'Fehler beim Abonieren des Newsletters. Bitte wenden Sie sich an vkm-rwl, oder versuchen Sie es erneut.'

        format.html { redirect_to "/abo_newsletters/new" }

      end

    end

  end



  def save

    @abo_newsletter = AboNewsletter.new(abo_newsletter_params)

    @abo_newsletter.enable = true



    respond_to do |format|

      if @abo_newsletter.save

        flash[:success] = 'Abonennt wurde erfolgreich gespeichert.'

        format.html { redirect_to "/abo_newsletters" }

      else

        flash[:error] = 'Fehler beim Abonieren des Newsletters. Bitte wenden Sie sich an vkm-rwl, oder versuchen Sie es erneut.'

        format.html { redirect_to "/abo_newsletters" }

      end

    end

  end



  # PATCH/PUT /abo_newsletters/1

  # PATCH/PUT /abo_newsletters/1.json

  def update

    respond_to do |format|

      if @abo_newsletter.update(abo_newsletter_params)

        flash[:success] = 'Ver&auml;nderungen wurden erfolgreich gespeichert.'

        format.html { redirect_to abo_newsletters_path , success: 'Ver&auml;nderungen f&uuml;r den Abonennt wurde erfolgreich gespeichert.' }

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

      flash[:success] = 'Abonennt wurde erfolgreich gel&ouml;scht.'

      format.html { redirect_to "/abo_newsletters" }

      format.json { head :no_content }

    end

  end

  def signPreOut

    if AboNewsletter.find(:all, :conditions => ["eMail = ?", abo_newsletter_abmelden_params[:eMail]])
      @abo_newsletter = AboNewsletter.find(:all, :conditions => ["eMail = ?", abo_newsletter_abmelden_params[:eMail]])
      if NewsMailer.abmelden_email(@abo_newsletter).deliver
      respond_to do |format|
        flash[:success] = 'Sie erhalten in k&uuml;rze eine Email.'

        format.html { redirect_to "/abo_newsletters/new" }
      end
      end
    else
      respond_to do |format|
        flash[:error] = 'Ihr Abo f&uuml;r den Newsletter wurde nicht abgemeldet. Bittte wenden Sie sich an vkm-rwl'

        format.html { redirect_to "/abo_newsletters/new" }
      end
    end

  end



  # Get /abo_newsletter/email/signOut

  def signOutNews

    @abo_newsletter = AboNewsletter.find(params[:email])

    @abo_newsletter.enable = false

    respond_to do |format|

      if @abo_newsletter.save

        flash[:success] = 'Ihr Abo f&uuml;r den Newsletter wurde erfolgreich abgemeldet.'

        format.html { redirect_to "/abo_newsletters/new" }

      else

        flash[:error] = 'Ihr Abo f&uuml;r den Newsletter wurde nicht abgemeldet. Bittte wenden Sie sich an vkm-rwl'

        format.html { redirect_to "/abo_newsletters/new" }

      end

    end

  end







  def export

    @abo_newsletters = AboNewsletter.order(:eMail)

    respond_to do |format|

      #format.html

   #   format.csv do

   #     headers['Content-Disposition'] = "attachment; filename=\"abos-list\""

    #    headers['Content-Type'] ||= 'text/csv'

     # end

      format.csv { send_data @abo_newsletters.to_csv }

      format.xls # { send_data @products.to_csv(col_sep: "\t") }

    end

  end







  def signInNews

    @abo_newsletter = AboNewsletter.find(params[:id])

    @abo_newsletter.enable = true

    respond_to do |format|

      if @abo_newsletter.save

        flash[:success] = 'Ihr Abo f&uuml;r den Newsletter wurde erfolgreich angemeldet.'

        format.html { redirect_to "/abo_newsletters/new" }

      else

        flash[:error] = 'Ihr Abo f&uuml;r den Newsletter wurde nicht angemeldet. Bitte wenden Sie sich an vkm-rwl'

        format.html { redirect_to "/abo_newsletters/new" }

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

      params.require(:abo_newsletter).permit(:eMail, :enable, :accept)

    end

    def abo_newsletter_abmelden_params

      params.require(:abo_newsletter).permit(:eMail)

    end


end

