class SearchController < ApplicationController

  def index

    @news = News.search(params[:keyword])
    puts(@news)
  end


end