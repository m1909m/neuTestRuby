
class VerbaandController < ApplicationController

  def verband

  end

  def fachgruppen
    @page = Page.where(accept: true, site: "Fachgruppen").order(:id).last
  end

  def diakonie
    @page = Page.where(accept: true, site: "Diakonie").order(:id).last
  end

  def vorstand

  end

  def geschäftsstelle

  end
end