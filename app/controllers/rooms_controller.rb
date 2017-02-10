class RoomsController < InheritedResources::Base

  respond_to :json

  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def angular

    @rooms = Room.all
    render 'rooms/_index'
  end

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
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
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:number, :size, :building)
    end
end

