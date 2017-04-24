class PagesController < ApplicationController

  before_action :set_pages, only: [:index]

  # GET /rooms
  # GET /rooms.json
  def index
    # @rooms = Room.all
    @site = params[:site]

    respond_to do |format|
      format.html

    end
  end

  def show
  end

  def new

  end

  def edit
  end

  def create
    @page = Room.new(room_params)
    @room.save
  end

  def update
    @page.update(room_params)

  end

  def destroy
    @page.destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pages
    @pages = Page.where(for: params[:site])
  end
  def room_params
    params.require(:page).permit(:content, :for, :free)
  end
end

