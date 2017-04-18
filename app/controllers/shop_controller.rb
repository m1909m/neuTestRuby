class ShopController < ApplicationController

  def batkf
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def entgelttabellen

  end

  def mvg

  end

  def handreichungen

  end
end