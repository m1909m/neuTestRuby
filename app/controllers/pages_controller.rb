class PagesController < ApplicationController

  before_action :set_page, only: [:index, :update]

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
    @page = Page.new(page_params)
    @page.save
  end

  def update
    @page.update(page_params)

  end

  def destroy
    @page.destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.where(for: params[:site]).order(:id).last
  end
  def page_params
    params.require(:page).permit(:content, :for, :free)
  end
end

