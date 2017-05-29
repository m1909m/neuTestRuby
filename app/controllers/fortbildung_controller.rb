class FortbildungController < ApplicationController
  def fortbildung
  end

  def fachgruppen

  end

  def seminarinhalte
    @page = Page.where(accept: true, for: "Seminarinhalte").order(:id).last
  end

  def bedingungen
    @page = Page.where(accept: true, for: "Teilnahmebedingungen").order(:id).last
  end

  def schulung
    @page = Page.where(accept: true, for: "Schulung").order(:id).last
  end

  def schulungForm
    ContactMailer.new_schulung(schulung_params).deliver
    flash[:success] = "Ihre Anfrage wurde erfolgreich versendet."
    redirect_to "/fortbildung/inHouseSchulungen"
  end

  private
  def schulung_params
    params.require(:schulung).permit(:einrichtung, :straße, :ort, :tel, :email, :thema, :partner, :personen, :termine)
  end

end