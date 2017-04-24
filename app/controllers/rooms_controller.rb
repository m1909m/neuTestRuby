class RoomsController < ApplicationController

  respond_to :json

  before_action :set_room, only: [:show, :destroy]
  before_action :set_event, only: [:edit, :update, :deleteEvent]

  def angular

    #@rooms = Room.all
    render 'rooms/index'
  end

  def calendar
    @id = params[:id]
    respond_to do |f|
      f.html
    end
  end

  def angularNew
    render 'rooms/new'
  end

  def showMembers
    render 'rooms/event'
  end

  # GET /rooms
  # GET /rooms.json
  def index
   # @rooms = Room.all
    respond_to do |format|
      format.json { render json: Room.all}

    end
  end

  def show
    render 'rooms/show'
  end

  def new
    @room = Room.new
  end

  def edit
    @id = params[:id]
    respond_to do |f|
      f.html
    end
  end

  def create
    @room = Room.new(room_params)
    @room.save
  end

  def update
    @event.title = event_params[:title]
    dateL = event_params[:dateL].split(' - ')
    @event.startLogin = dateL[0].to_time.strftime("%Y-%m-%d %k:%M:%S")

    @event.endLogin = dateL[1].to_time.strftime("%Y-%m-%d %k:%M:%S")
    date = event_params[:date].split(' - ')
    @event.start = date[0].to_time.strftime("%Y-%m-%d %k:%M:%S")
    @event.end = date[1].to_time.strftime("%Y-%m-%d %k:%M:%S")
    @event.minSize = event_params[:minSize]
    @event.save
    redirect_to :action => "calendar", :id => @event.room_id
  end

  def destroy
    @room.destroy

  end

  def deleteEvent
    @id = @event.room_id
    @event.destroy
    redirect_to :action => "calendar", :id => @id
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
    def set_event
      @event = CEvent.find(params[:id])
    end
    def event_params
      params.require(:event).permit(:title, :description, :dateL, :date, :minSize)
    end
    def room_params
      params.require(:room).permit(:number, :size, :building)
    end
end

