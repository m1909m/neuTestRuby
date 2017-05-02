class CEventsController < ApplicationController

  respond_to :json
  before_action :set_c_event, only: [:show, :edit, :update, :destroy]

  def index
  #  @events = CEvent.where(start: params[:start]..params[:end])
    @c_events = CEvent.where(room_id: params[:roomid])
    @json = []
    @c_events.each do |event|
      if(event.start != nil && event.end != nil)
        @json.push({title: event.title, start: event.start, end: event.end, id: event.id})
      end
      if(event.startSecond != nil && event.endSecond != nil)
        @json.push({title: event.title, start: event.startSecond, end: event.endSecond, id: event.id})
      end
      if(event.startThird != nil && event.endThird != nil)
        @json.push({title: event.title, start: event.startThird, end: event.endThird, id: event.id})
      end
    end
    respond_to do |format|
      format.json { render json: @json}
    end
  end

  def byMail
    respond_to do |format|
      format.json { render json: CEvent.where( userMail: current_user.email) }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: Member.where( event_id: params[:id]) }
    end
  end

  def abmelden
    @member = Member.find(params[:id])
    @event = CEvent.find(@member.event_id)
    @member.accept = false
    @member.save
    members = @event.member
    @event.member = members - 1
    @event.save
  end

  def new
    @c_event = CEvent.new

  end

  def edit
  end

  def create
    @c_event = CEvent.new(c_event_params)
    # TODO Tests
    @c_event.userMail = current_user.email
    @c_event.save
  end

  def update
    @c_event.update(c_event_params)
  end

  def destroy
    @id = @c_event.room_id
    @c_event.destroy
   # redirect_to "/administrator/rooms/" + @id

  end

  private

    def set_c_event
      @c_event = CEvent.find(params[:id])
    end



    def c_event_params
      params.require(:c_event).permit(:title, :start, :end, :startSecond, :endSecond, :startThird, :endThird,:startLogin, :endLogin, :color, :description, :room_id, :minSize, :member, :maxSize, :free)
    end
end

