class CurrentController < ApplicationController
  def index
  end

  def mitgliedschaft
    @page = Page.where(accept: true, for: "Mitgliedschaft").order(:id).last
  end

  def impressum

  end
  def informationen

  end
  def agb

  end
  def arkrwl

  end
  def arkdd

  end




end
