class DetalleubicacionsController < ApplicationController
  before_action :set_detalleubicacion, only: [:show, :edit, :update, :destroy]

  # GET /detalleubicacions
  # GET /detalleubicacions.json
  def index
    @detalleubicacions = Detalleubicacion.all
  end

  # GET /detalleubicacions/1
  # GET /detalleubicacions/1.json
  def show
  end

  # GET /detalleubicacions/new
  def new
    @detalleubicacion = Detalleubicacion.new
  end

  # GET /detalleubicacions/1/edit
  def edit
  end

  # POST /detalleubicacions
  # POST /detalleubicacions.json
  def create
    @detalleubicacion = Detalleubicacion.new(detalleubicacion_params)

    respond_to do |format|
      if @detalleubicacion.save
        format.html { redirect_to @detalleubicacion, notice: 'Detalleubicacion was successfully created.' }
        format.json { render :show, status: :created, location: @detalleubicacion }
      else
        format.html { render :new }
        format.json { render json: @detalleubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalleubicacions/1
  # PATCH/PUT /detalleubicacions/1.json
  def update
    respond_to do |format|
      if @detalleubicacion.update(detalleubicacion_params)
        format.html { redirect_to @detalleubicacion, notice: 'Detalleubicacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalleubicacion }
      else
        format.html { render :edit }
        format.json { render json: @detalleubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalleubicacions/1
  # DELETE /detalleubicacions/1.json
  def destroy
    @detalleubicacion.destroy
    respond_to do |format|
      format.html { redirect_to detalleubicacions_url, notice: 'Detalleubicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalleubicacion
      @detalleubicacion = Detalleubicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalleubicacion_params
      params.require(:detalleubicacion).permit(:nombre, :ubicacionvivienda_id)
    end
end
