class CEventsController < ApplicationController

  respond_to :json
  before_action :set_c_event, only: [:show, :edit, :update, :destroy]

  def index
  #  @events = CEvent.where(start: params[:start]..params[:end])
    #@c_events = CEvent.all
    respond_to do |format|
      format.json { render json: CEvent.where(room_id: params[:id])}

    end
  end

  def show
  end

  def new
    @c_event = CEvent.new
  end

  def edit
  end

  def create
    @c_event = CEvent.new(event_params)
    @c_event.save
  end

  def update
    @c_event.update(event_params)
  end

  def destroy
    @c_event.destroy
  end

  private

    def set_c_event
      @c_event = CEvent.find(params[:id])
    end

    def c_event_params
      params.require(:c_event).permit(:title, :start, :end, :color, :description)
    end
end

