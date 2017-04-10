class RoomsController < ApplicationController

  respond_to :json

  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def angular

    #@rooms = Room.all
    render 'rooms/index'
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
  end

  def create
    @page = Room.new(room_params)
    @room.save
  end

  def update
    @room.update(room_params)

  end

  def destroy
    @room.destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @page = Page.find(params[:id])
  end
  def room_params
    params.require(:page).permit(:content, :for, :free)
  end
end

