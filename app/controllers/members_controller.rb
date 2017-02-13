class MembersController < ApplicationController

  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new]
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @events = CEvent.find_by_free(true)
    @rooms = Room.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @events = CEvent.find_by_free(true)
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|

      if @member.save
        format.html { redirect_to @member, notice: 'Mitglied wurde erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @member }
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
      if @member.update(newssystem_params)
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
    $eventNumber = params[:id]
  end

  def member_params
      params.require(:member).permit(:gender, :firstName, :lastName, :street, :plz, :place, :job, :phone, :eMail, :sleep, :room, :nameCompany, :streetCompany, :placeCompany, :veggie, :accept, :event_id)
    end
end

