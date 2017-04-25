class SearchController < ApplicationController

  def index

    @news = News.search(params[:keyword])
    puts(@news)
    @newsletter = NewsContent.search(params[:keyword])

  end


end