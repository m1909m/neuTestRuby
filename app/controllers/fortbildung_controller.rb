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
end