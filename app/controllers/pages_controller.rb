class PagesController < ApplicationController



  before_action :set_page, only: [:index, :update]



  # GET /rooms

  # GET /rooms.json

  def index

    # @rooms = Room.all

    @site = params[:site]



    respond_to do |format|

      format.html



    end

  end



  def all



  end



  def show

  end



  def new



  end



  def edit

  end



  def create

    @page = Page.new(page_params)

    @page.save

    flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" erstellt."

    redirect_to "/pages"

  end



  def update

    if @page.for == "diakonie"

      if @page.update(page_params)

        flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

        ContactMailer.change_diakonie(page_params[:content]).deliver

      end

    elsif @page.for == "GBB"

      if @page.update(page_params)

        flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

        ContactMailer.change_gbb(page_params[:content]).deliver

      end

    elsif @page.for == "Paedagogik"

      if @page.update(page_params)

        flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

        ContactMailer.change_paedagogik(page_params[:content]).deliver

      end

    elsif @page.for == "Hauswirtschaft_Rheinland"

      if @page.update(page_params)

        flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

        ContactMailer.change_hUndh_Rheinland(page_params[:content]).deliver

      end

    elsif @page.for == "Hauswirtschaft_Lippe"

      if @page.update(page_params)

        flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

        ContactMailer.change_haustechnik_westfalen(page_params[:content]).deliver

      end

    else

      @page.update(page_params)

      flash[:success] = "Sie haben erfolgreich die Seite \"" + @page.for + "\" aktualisiert."

    end



    redirect_to "/pages"

  end



  def destroy

    @page.destroy



  end



  private

  # Use callbacks to share common setup or constraints between actions.

  def set_page

    @page = Page.where(for: params[:site]).order(:id).last

  end

  def page_params

    params.require(:page_content).permit(:content, :for, :free)

  end

end



