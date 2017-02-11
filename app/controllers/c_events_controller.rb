class CEventsController < InheritedResources::Base

  before_action :set_c_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = CEvent.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = CEvent.new
  end

  def edit
  end

  def create
    @event = CEvent.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

    def set_c_event
      @event = CEvent.find(params[:id])
    end

    def c_event_params
      params.require(:c_event).permit(:title, :start, :end, :color, :description)
    end
end

