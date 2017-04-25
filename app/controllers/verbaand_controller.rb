
class VerbaandController < ApplicationController

  def verband
    @page = Page.where(accept: true, for: "Berufsverbände").order(:id).last
  end

  def fachgruppen
    @page = Page.where(accept: true, for: "Fachgruppen").order(:id).last
  end

  def diakonie
    @page = Page.where(accept: true, for: "Diakonie").order(:id).last
  end

  def vorstand
    @page = Page.where(accept: true, for: "Vorstand").order(:id).last
  end

  def geschäftsstelle
    @page = Page.where(accept: true, for: "Geschäftsstelle").order(:id).last
  end
end