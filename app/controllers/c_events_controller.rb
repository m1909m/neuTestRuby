class CEventsController < ApplicationController

  respond_to :json
  before_action :set_c_event, only: [:show, :edit, :update, :destroy]

  def index
  #  @events = CEvent.where(start: params[:start]..params[:end])
    #@c_events = CEvent.all
    respond_to do |format|
      format.json { render json: CEvent.where(room_id: params[:roomid])}
    end
  end

  def byMail
    respond_to do |format|
      format.json { render json: CEvent.where( userMail: current_user.eMail) }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: Member.where( event_id: params[:id]) }
    end
  end

  def new
    @c_event = CEvent.new

  end

  def edit
  end

  def create
    @c_event = CEvent.new(c_event_params)
    # TODO Tests
    @c_event = @c_event.addUserEmail(current_user.eMail)
    @c_event.save
  end

  def update
    @c_event.update(c_event_params)
  end

  def destroy
    @c_event.destroy
  end

  private

    def set_c_event
      @c_event = CEvent.find(params[:id])
    end



    def c_event_params
      params.require(:c_event).permit(:title, :start, :end,:startLogin, :endLogin, :color, :description, :room_id, :minSize, :member, :maxSize, :free)
    end
end

