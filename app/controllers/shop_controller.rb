class ShopController < ApplicationController

  def batkf
    @page = Page.where(accept: true, for: "batkf").order(:id).last
  end

  def entgelttabellen
    @page = Page.where(accept: true, for: "entgelttabellen").order(:id).last
  end

  def mvg
    @page = Page.where(accept: true, for: "mvg").order(:id).last
  end

  def handreichungen
    @page = Page.where(accept: true, for: "handreichungen").order(:id).last
  end

end