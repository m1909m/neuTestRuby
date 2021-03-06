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

      format.json { render json: CEvent.where('start > ? ', Time.now).order(:start) }

    end

  end



  def show

    respond_to do |format|

      format.json { render json: Member.where( event_id: params[:id]) }

    end

  end



  def abmelden

    @member = Member.find(params[:id])
    @eventid = @member.event_id

    @event = CEvent.find(@member.event_id)

    @member.accept = false

    @member.save
    if @member.eMail != ""
      ContactMailer.abmelden_event(@member, @event).deliver
      ContactMailer.abmelden_event_vkm_only(@member, @event).deliver
    end



    @event.member = @event.member - 1

    if @event.free == 0 && @event.maxSize > @event.member

      @event.free = 1

    end

    @event.save
    respond_to do |format|

      format.json { render json: Member.where( event_id: @eventid) }

    end

  end

  def anmelden
    @member = Member.find(params[:id])
    @event = CEvent.find(@member.event_id)
    @eventid = @member.event_id
    @member.accept = true
    @member.save

    @event.member = @event.member + 1
    if @event.free == 1 && @event.maxSize <= @event.member
      @event.free = 0
    end
    @event.save
    respond_to do |format|

      format.json { render json: Member.where( event_id: @eventid) }

    end
  end



  def sendAcceptMail

    @member = Member.find(params[:id])

    @eventid = @member.event_id
    @event = CEvent.find(@member.event_id)
    @room = Room.find(@event.room_id)
    if @event.accountName != nil && @event.accountName != ""
      logger.info("AccountName != nil and ''")
      @user = User.where( email: @event.accountName)
      @crypt = ActiveSupport::MessageEncryptor.new("<\xE4i\x8BB\xD1[\x98{\x9F\xDE1\xC6u\x06\xFC\xF8!\xC6\xED\xFEh\xAF\xF5\xA2\xE8\xC6jy,\x19/1\xBB\xEE\x9Es\xA3(\x971\xD3\xBFR!8\x13\xB8\xCDV\xD7\x03\xC8R@v\xF5.\xCF\xBAA\x890\xD8")
      @pass = @crypt.decrypt_and_verify(@user[0].passwordEncrypt)
      if ContactMailer.accept_event(@member, @event, @room, @user[0], @pass).deliver
        @member.sendAccept = true
      else
        respond_to do |format|

          format.json { render status: :unprocessable_entity, json: {
              success: false,
              info: "Fehler beim Senden der Email",
              data: {}
          } }

        end
        #flash[:error] = "Fehler beim Senden der Email"
      end
    else
	    logger.info("Kein Benutzer definiert")
       if ContactMailer.accept_event_not_user(@member, @event, @room).deliver
         @member.sendAccept = true
       else
         respond_to do |format|

           format.json { render status: :unprocessable_entity, json: {
               success: false,
               info: "Fehler beim Senden der Email",
               data: {}
           } }

         end
        # flash[:error] = "Fehler beim Senden der Email"
       end
    end

    if @member.save
      respond_to do |format|

        format.json { render json: Member.where( event_id: @eventid) }

      end
    else

    end

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



    @c_event.startLogin = c_event_params[:startLogin].to_time.strftime("%Y-%m-%d %k:%M:%S %z")

    @c_event.endLogin = c_event_params[:endLogin].to_time.strftime("%Y-%m-%d %k:%M:%S %z")

    @c_event.userMail = current_user.email

    @c_event.member = 0

    @c_event.free = 1





    if c_event_params[:nickname] != "" && c_event_params[:nickname] != nil

      @c_event.accountName = c_event_params[:nickname]

    





    @user = User.where(email: c_event_params[:nickname]).last



    if @c_event.save

      puts(current_user.email)

      if current_user.email == "admin@vkm.de" || current_user.email == "admin"

        @crypt = ActiveSupport::MessageEncryptor.new("<\xE4i\x8BB\xD1[\x98{\x9F\xDE1\xC6u\x06\xFC\xF8!\xC6\xED\xFEh\xAF\xF5\xA2\xE8\xC6jy,\x19/1\xBB\xEE\x9Es\xA3(\x971\xD3\xBFR!8\x13\xB8\xCDV\xD7\x03\xC8R@v\xF5.\xCF\xBAA\x890\xD8")

        @pass = @crypt.decrypt_and_verify(@user.passwordEncrypt)



        ContactMailer.create_event("system@vkm-rwl.de", @pass, @c_event).deliver

        flash[:success] = "Sie haben erfolgreich die Veranstaltung erstellt. Sie erhalten in k&uuml;rze eine E-Mail."

      else

 #       @key   = ActiveSupport::KeyGenerator.new('password').generate_key(ENV['salt'], 32)

        @crypt = ActiveSupport::MessageEncryptor.new("<\xE4i\x8BB\xD1[\x98{\x9F\xDE1\xC6u\x06\xFC\xF8!\xC6\xED\xFEh\xAF\xF5\xA2\xE8\xC6jy,\x19/1\xBB\xEE\x9Es\xA3(\x971\xD3\xBFR!8\x13\xB8\xCDV\xD7\x03\xC8R@v\xF5.\xCF\xBAA\x890\xD8")

        ContactMailer.create_event(current_user.email, @crypt.decrypt_and_verify(@user.passwordEncrypt), @c_event).deliver

        flash[:success] = "Sie haben erfolgreich die Veranstaltung erstellt. Sie erhalten in k&uuml;rze eine E-Mail."

      end

    end
  else
    if @c_event.save


      if current_user.email == "admin@vkm.de" || current_user.email == "admin"


        flash[:success] = "Sie haben erfolgreich die Veranstaltung erstellt."

      else



        flash[:success] = "Sie haben erfolgreich die Veranstaltung erstellt."

      end

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

    @members = Member.where(event_id: @c_event.id).where(accept: 1)

    if @members != nil && @members.length > 0

      @members.each do |m|

        ContactMailer.storno_event(m, @c_event).deliver
        ContactMailer.abmelden_event_vkm(m, @c_event).deliver

      end

    end

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



