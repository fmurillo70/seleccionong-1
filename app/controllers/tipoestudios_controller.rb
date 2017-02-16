class TipoestudiosController < ApplicationController
  before_action :set_tipoestudio, only: [:show, :edit, :update, :destroy]

  # GET /tipoestudios
  # GET /tipoestudios.json
  def index
    @tipoestudios = Tipoestudio.all
  end

  # GET /tipoestudios/1
  # GET /tipoestudios/1.json
  def show
  end

  # GET /tipoestudios/new
  def new
    @tipoestudio = Tipoestudio.new
  end

  # GET /tipoestudios/1/edit
  def edit
  end

  # POST /tipoestudios
  # POST /tipoestudios.json
  def create
    @tipoestudio = Tipoestudio.new(tipoestudio_params)

    respond_to do |format|
      if @tipoestudio.save
        format.html { redirect_to @tipoestudio, notice: 'Tipoestudio was successfully created.' }
        format.json { render :show, status: :created, location: @tipoestudio }
      else
        format.html { render :new }
        format.json { render json: @tipoestudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoestudios/1
  # PATCH/PUT /tipoestudios/1.json
  def update
    respond_to do |format|
      if @tipoestudio.update(tipoestudio_params)
        format.html { redirect_to @tipoestudio, notice: 'Tipoestudio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipoestudio }
      else
        format.html { render :edit }
        format.json { render json: @tipoestudio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoestudios/1
  # DELETE /tipoestudios/1.json
  def destroy
    @tipoestudio.destroy
    respond_to do |format|
      format.html { redirect_to tipoestudios_url, notice: 'Tipoestudio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipoestudio
      @tipoestudio = Tipoestudio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipoestudio_params
      params.require(:tipoestudio).permit(:nombre)
    end
end
