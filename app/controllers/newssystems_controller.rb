class NewssystemsController < ApplicationController
  before_action :set_newssystem, only: [:show, :edit, :update, :destroy]

  # GET /newssystems
  # GET /newssystems.json
  def index
    @newssystems = Newssystem.all
  end

  # GET /newssystems/1
  # GET /newssystems/1.json
  def show
  end

  # GET /newssystems/new
  def new
    @newssystem = Newssystem.new
  end

  # GET /newssystems/1/edit
  def edit
  end

  # POST /newssystems
  # POST /newssystems.json
  def create
    @newssystem = Newssystem.new(newssystem_params)

    respond_to do |format|
      if @newssystem.save
        format.html { redirect_to @newssystem, notice: 'Newssystem was successfully created.' }
        format.json { render :show, status: :created, location: @newssystem }
      else
        format.html { render :new }
        format.json { render json: @newssystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newssystems/1
  # PATCH/PUT /newssystems/1.json
  def update
    respond_to do |format|
      if @newssystem.update(newssystem_params)
        format.html { redirect_to @newssystem, notice: 'Newssystem was successfully updated.' }
        format.json { render :show, status: :ok, location: @newssystem }
      else
        format.html { render :edit }
        format.json { render json: @newssystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newssystems/1
  # DELETE /newssystems/1.json
  def destroy
    @newssystem.destroy
    respond_to do |format|
      format.html { redirect_to newssystems_url, notice: 'Newssystem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newssystem
      @newssystem = Newssystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newssystem_params
      params.require(:newssystem).permit(:title, :subTitle, :story)
    end
end
