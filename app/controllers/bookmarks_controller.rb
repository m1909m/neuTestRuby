class BookmarksController < ApplicationController

  before_filter :find_bookmark, :only => [:edit, :destroy, :update]
  before_filter :check_url, :only => [:create]

  def new
    @bookmark = Bookmark.new(params[:bookmark])
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
    # redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @bookmark.destroy
    redirect_to current_user, :flash => { :notice => "Bookmark erfolgreich gelöscht."}
  end

  def update
    if @bookmark.update_attributes(params[:bookmark])
      # redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  protected

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.blank?
      redirect_to root_url, :flash => { :alert =>"Keine Bookmarks."}
    end
  end

  def check_url
    
  end


end
