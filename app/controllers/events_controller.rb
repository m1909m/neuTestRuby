class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @room = params[:maxSize]
    if params[:weeks].to_i <= 0
      @startdateVa = params[:startDate]
      @hours = params[:hours]
#      @room = Room.find_by_size([params[:minSize]. params[:maxSize]])
      @roomplaning = Roomplaning.new
      @roomplaning.year = @startdateVa.strftime("%Y")
      @roomplaning.week = @startdateVa.cweek
      @day = @startdateVa.strftime("%a")
      case @day
        when "Mon"
          @roomplaning.monday = @startdateVa
        when "Tue"
          @roomplaning.tuesday = @startdateVa
        when "Wed"
          @roomplaning.wednesday = @startdateVa
        when "Thu"
          @roomplaning.thursday = @startdateVa
        when "Fri"
          @roomplaning.friday = @startdateVa
        else
      end

      @roomplaning.events = @event
      @event.publish = false
      if @roomplaning.save
        format.html { redirect_to @roomplaning, notice: 'roomplaning was successfully created.' }
        format.json { render :show, status: :created, location: @roomplaning }
      else
        format.html { render :new }
        format.json { render json: @roomplaning.errors, status: :unprocessable_entity }
      end
    else

    end


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :minSize, :maxSize, :hours, :weeks, :startDate, :endDate, :startLoginDate, :endLoginDate)
    end
end
