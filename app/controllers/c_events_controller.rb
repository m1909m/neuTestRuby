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
    if @event.free = 0 && @event.maxSize > @event.member
      @event.free = 1
    end
    @event.save
  end

  def new
    @c_event = CEvent.new

  end

  def edit
  end

  def create
    @c_event = CEvent.new


    @c_event.title = c_event_params[:title]
    @c_event.description = c_event_params[:description]
    @c_event.minSize = c_event_params[:minSize]
    @c_event.maxSize = c_event_params[:maxSize]
    @startdateOne = c_event_params[:dateOne] + " " + c_event_params[:starttimeOne]
    @enddateOne = c_event_params[:dateOne] + " " + c_event_params[:endtimeOne]
    @c_event.start =  @startdateOne.to_time.strftime("%Y-%m-%d %k:%M:%S")
    @c_event.end = @enddateOne.to_time.strftime("%Y-%m-%d %k:%M:%S")
    if(c_event_params[:dateTwo] != "")
      @startdateTwo = c_event_params[:dateTwo] + " " + c_event_params[:starttimeTwo]
      @enddateTwo = c_event_params[:dateTwo] + " " + c_event_params[:endtimeTwo]
      @c_event.startSecond = @startdateTwo.to_time.strftime("%Y-%m-%d %k:%M:%S")
      @c_event.endSecond = @enddateTwo.to_time.strftime("%Y-%m-%d %k:%M:%S")
    end
    if(c_event_params[:dateThree] != "")
      @startdateThree = c_event_params[:dateThree] + " " + c_event_params[:starttimeThree]
      @enddateThree = c_event_params[:dateThree] + " " + c_event_params[:endtimeThree]
      @c_event.startThird = @startdateThree.to_time.strftime("%Y-%m-%d %k:%M:%S")
      @c_event.endThird = @enddateThree.to_time.strftime("%Y-%m-%d %k:%M:%S")
    end
    @c_event.room_id = c_event_params[:room_id]

    @c_event.startLogin = c_event_params[:startLogin].to_time.strftime("%Y-%m-%d %k:%M:%S")
    @c_event.endLogin = c_event_params[:endLogin].to_time.strftime("%Y-%m-%d %k:%M:%S")
    @c_event.userMail = current_user.email
    @c_event.member = 0
    @c_event.free = 1

    if current_user.email == "admin@vkm.de"
      @password = "admin1234"
    else
      @password = SecureRandom.hex(8)
    end

    # TODO return error when :nickname and :nicknameSelect = nil


    if c_event_params[:nickname] != "" && c_event_params[:nickname] != nil
      @email = c_event_params[:nickname]
    end

    @user = User.new({:email => c_event_params[:nickname], :roles => Role.where(name: "event"), :password => @password, :password_confirmation => @password })

    if @user.save
      @c_event.accountName = @user.email

    end

    if @c_event.save
      if current_user.email == "admin@vkm.de"

      else
        ContactMailer.create_event(current_user.email, @password, @c_event)
      end
    end
    #TODO send Email
    redirect_to "/administrator/rooms/" + c_event_params[:room_id]
  end



  def update
    @c_event.update(c_event_params)
  end

  def destroy
    @id = @c_event.room_id
    @accounts = Account.where(accountName: @c_event.accountName)
    @accounts.destroy_all
    @c_event.destroy
   # redirect_to "/administrator/rooms/" + @id

  end



  private

    def set_c_event
      @c_event = CEvent.find(params[:id])
    end

    def c_event_params
      params.require(:c_event).permit(:title, :dateOne, :starttimeOne, :endtimeOne, :dateTwo, :starttimeTwo, :endtimeTwo, :dateThree, :starttimeThree, :endtimeThree, :nickname, :nicknameSelect, :dateL,:startLogin, :endLogin, :color, :description, :room_id, :minSize, :member, :maxSize, :free)
    end
end

