class RoomsController < ApplicationController

  respond_to :json

  before_action :set_room, only: [:show, :destroy]
  before_action :set_event, only: [:edit, :update]

  def angular

    #@rooms = Room.all
    render 'rooms/index'
  end

  def calendar
    @id = params[:id]
    render 'rooms/calendar'
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
    render 'rooms/edit'
  end

  def create
    @room = Room.new(room_params)
    @room.save
  end

  def update
    @event.title = params[:title]
    
    @event.minSize = params[:minSize]
    @event.update
    @id = params[:id]
    render 'rooms/index'
  end

  def destroy
    @room.destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
    def set_event
      @event = CEvent.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:number, :size, :building)
    end
end

