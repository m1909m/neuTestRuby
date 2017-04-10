
class VerbaandController < ApplicationController

  def verband

  end

  def fachgruppen
    @page = Page.where(accept: true).order(:id).last
  end

  def vorstand

  end

  def geschäftsstelle

  end
end