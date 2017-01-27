class RoomplaningsController < InheritedResources::Base

  before_action :set_roomplaning, only: [:show, :edit, :update, :destroy]

  # GET /roomplanings
  # GET /roomplanings.json
  def index
    @roomplanings = Roomplaning.all
  end

  # GET /roomplanings/1
  # GET /roomplanings/1.json
  def show
  end

  # GET /roomplanings/new
  def new
    @roomplaning = Roomplaning.new
  end

  # GET /roomplanings/1/edit
  def edit
  end

  # POST /roomplanings
  # POST /roomplanings.json
  def create
    @roomplaning = Roomplaning.new(roomplaning_params)


    respond_to do |format|

      if @roomplaning.save
        format.html { redirect_to @roomplaning, notice: 'roomplaning was successfully created.' }
        format.json { render :show, status: :created, location: @roomplaning }
      else
        format.html { render :new }
        format.json { render json: @roomplaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roomplanings/1
  # PATCH/PUT /roomplanings/1.json
  def update
    respond_to do |format|
      if @roomplaning.update(roomplaning_params)
        format.html { redirect_to @roomplaning, notice: 'Nroomplaning was successfully updated.' }
        format.json { render :show, status: :ok, location: @roomplaning }
      else
        format.html { render :edit }
        format.json { render json: @roomplaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roomplanings/1
  # DELETE /roomplanings/1.json
  def destroy
    @roomplaning.destroy
    respond_to do |format|
      format.html { redirect_to roomplaning_url, notice: 'roomplaning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_roomplaning
      @roomplaning = Roomplaning.find(params[:id])
    end
    def roomplaning_params
      params.require(:roomplaning).permit(:year, :week, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end

