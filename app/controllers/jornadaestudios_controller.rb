class JornadaestudiosController < ApplicationController
  before_action :set_jornadaestudio, only: [:show, :edit, :update, :destroy]

  # GET /jornadaestudios
  # GET /jornadaestudios.json
  def index
    @jornadaestudios = Jornadaestudio.all
  end

  # GET /jornadaestudios/1
  # GET /jornadaestudios/1.json
  def show
  end

  # GET /jornadaestudios/new
  def new
    @jornadaestudio = Jornadaestudio.new
  end

  # GET /jornadaestudios/1/edit
  def edit
  end

  # POST /jornadaestudios
  # POST /jornadaestudios.json
  def create
    @jornadaestudio = Jornadaestudio.new(jornadaestudio_params)

    respond_to do |format|
      if @jornadaestudio.save
        format.html { redirect_to @jornadaestudio, notice: 'Jornadaestudio was successfully created.' }
        format.json { render :show, status: :created, location: @jornadaestudio }
      else
        format.html { render :new }
        format.json { render json: @jornadaestudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jornadaestudios/1
  # PATCH/PUT /jornadaestudios/1.json
  def update
    respond_to do |format|
      if @jornadaestudio.update(jornadaestudio_params)
        format.html { redirect_to @jornadaestudio, notice: 'Jornadaestudio was successfully updated.' }
        format.json { render :show, status: :ok, location: @jornadaestudio }
      else
        format.html { render :edit }
        format.json { render json: @jornadaestudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jornadaestudios/1
  # DELETE /jornadaestudios/1.json
  def destroy
    @jornadaestudio.destroy
    respond_to do |format|
      format.html { redirect_to jornadaestudios_url, notice: 'Jornadaestudio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jornadaestudio
      @jornadaestudio = Jornadaestudio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jornadaestudio_params
      params.require(:jornadaestudio).permit(:nombre)
    end
end
