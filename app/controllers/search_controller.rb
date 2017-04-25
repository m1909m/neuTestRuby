class SearchController < ApplicationController

  def index
    @sunspot_search = Sunspot.search News do |query|
      query.keywords params[:keyword]
      query.paginate(:page => 30, :per_page => 30)
    end
    puts(@sunspot_search)
  end


end