class SearchController < ApplicationController

  def index

    @news = News.search(params[:keyword])
    puts(@news)
    @news_contents = NewsContent.search(params[:keyword])

  end


end