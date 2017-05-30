
class VerbaandController < ApplicationController

  def verband
    @page = Page.where(accept: true, for: "Berufsverbände").order(:id).last
  end

  def fachgruppen
    @page = Page.where(accept: true, for: "Fachgruppen").order(:id).last
  end

  def gbb
    @page = Page.where(accept: true, for: "GBB").order(:id).last
  end

  def diakonie
    @page = Page.where(accept: true, for: "Diakonie").order(:id).last
  end

  def pädagogik
    @page = Page.where(accept: true, for: "Pädagogik").order(:id).last
  end

  def hRheinland
    @page = Page.where(accept: true, for: "Hauswirtschaft_Rheinland").order(:id).last
  end

  def hLippe
    @page = Page.where(accept: true, for: "Hauswirtschaft_Lippe").order(:id).last
  end

  def vorstand
    @page = Page.where(accept: true, for: "Vorstand").order(:id).last
  end

  def geschäftsstelle
    @page = Page.where(accept: true, for: "Geschäftsstelle").order(:id).last
  end


end