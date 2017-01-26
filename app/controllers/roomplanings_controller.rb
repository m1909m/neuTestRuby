class RoomplaningsController < InheritedResources::Base

  before_action :set_newssystem, only: [:show, :edit, :update, :destroy]

  # GET /newssystems
  # GET /newssystems.json
  def index
    @roomplaning = Roomplaning.all
  end

  # GET /newssystems/1
  # GET /newssystems/1.json
  def show
  end

  # GET /newssystems/new
  def new
    @roomplaning= Roomplaning.new
  end

  # GET /newssystems/1/edit
  def edit
  end

  # POST /newssystems
  # POST /newssystems.json
  def create
    @roomplaning = Roomplaning.new(newssystem_params)


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

  # PATCH/PUT /newssystems/1
  # PATCH/PUT /newssystems/1.json
  def update
    respond_to do |format|
      if @roomplaning.update(newssystem_params)
        format.html { redirect_to @roomplaning, notice: 'Nroomplaning was successfully updated.' }
        format.json { render :show, status: :ok, location: @roomplaning }
      else
        format.html { render :edit }
        format.json { render json: @roomplaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newssystems/1
  # DELETE /newssystems/1.json
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

