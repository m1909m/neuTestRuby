class MembersController < ApplicationController

  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new]
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
 #   puts(DateTime.now.to_date)
    @events = CEvent.where(free: true).where('`c_events`.`startLogin` < ?', Time.now.utc).where('`c_events`.`endLogin` > ?', Time.now.utc).order(:start)

    @eventsOver = CEvent.where(free: true).where('`c_events`.`endLogin` < ?', Time.now.utc-2).where('`c_events`.`start` > ?', Time.now.utc).order(:start)

    @rooms = Room.all
  end

  def byEvent
    respond_to do |format|
      format.json { render json: Member.where(event_id: params[:id]) }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    if member_params[:nameR] != ""
      @member.nameR = member_params[:nameR]
    else
      @member.nameR = @member.lastName
    end

    if member_params[:vornameR] != ""
      @member.vornameR = member_params[:vornameR]
    else
      @member.vornameR = @member.firstName
    end

    if member_params[:vornameR] != ""
      @member.einrichtungR = member_params[:einrichtungR]
    else
      @member.einrichtungR = @member.nameCompany
    end

    if member_params[:adresseR] != ""
      @member.adresseR = member_params[:adresseR]
    else
      @member.adresseR = @member.street
    end

    if member_params[:ortR] != ""
      @member.ortR = member_params[:ortR]
    else
      @member.ortR = @member.plz
    end

    if member_params[:emailR] != ""
      @member.emailR = member_params[:emailR]
    else
      @member.emailR = @member.eMail
    end




    @event = CEvent.find(@member.event_id)
    #  Rechnungsaanschrift
    respond_to do |format|
      if @member.save
          ContactMailer.new_member(@member, @event).deliver
          ContactMailer.new_member_vkm(@member, @event).deliver
          flash[:success] = "Sie haben sich erfolgreich angemeldet und erhalten in Kürze eine Bestätigung per E-Mail."
          format.html { redirect_to :action => "index" }
        else
          format.html { render :new }
          format.json { render json: @member.errors, status: :unprocessable_entity }

        end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Mitglied wurde erfolgreich geändert.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Mitglied wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def set_event
    @event = CEvent.find(params[:id])
  end

  def member_params
      params.require(:member).permit(:gender, :firstName, :lastName, :street, :plz, :place, :job, :phone, :eMail, :sleep, :room, :nameCompany, :streetCompany, :placeCompany, :veggie, :accept, :event_id, :nameR, :vornameR, :einrichtungR, :adresseR, :ortR, :emailR)
    end
end

