
class VerbaandController < ApplicationController

  def verband

  end

  def fachgruppen
    @page = Page.where(accept: true, for: "Fachgruppen").order(:id).last
  end

  def diakonie
    @page = Page.where(accept: true, for: "Diakonie").order(:id).last
  end

  def vorstand

  end

  def geschäftsstelle
    @page = Page.where(accept: true, for: "geschäftsstelle").order(:id).last
  end
end