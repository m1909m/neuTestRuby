class CEventsController < InheritedResources::Base

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def c_event_params
      params.require(:c_event).permit(:title, :start, :end, :color, :description)
    end
end

