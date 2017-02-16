class OpcionesRespuestaController < ApplicationController
  before_action :set_opciones_respuestum, only: [:show, :edit, :update, :destroy]

  # GET /opciones_respuesta
  # GET /opciones_respuesta.json
  def index
    @opciones_respuesta = OpcionesRespuestum.all
  end

  # GET /opciones_respuesta/1
  # GET /opciones_respuesta/1.json
  def show
  end

  # GET /opciones_respuesta/new
  def new
    @opciones_respuestum = OpcionesRespuestum.new
  end

  # GET /opciones_respuesta/1/edit
  def edit
  end

  # POST /opciones_respuesta
  # POST /opciones_respuesta.json
  def create
    @opciones_respuestum = OpcionesRespuestum.new(opciones_respuestum_params)

    respond_to do |format|
      if @opciones_respuestum.save
        format.html { redirect_to @opciones_respuestum, notice: 'Opciones respuestum was successfully created.' }
        format.json { render :show, status: :created, location: @opciones_respuestum }
      else
        format.html { render :new }
        format.json { render json: @opciones_respuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opciones_respuesta/1
  # PATCH/PUT /opciones_respuesta/1.json
  def update
    respond_to do |format|
      if @opciones_respuestum.update(opciones_respuestum_params)
        format.html { redirect_to @opciones_respuestum, notice: 'Opciones respuestum was successfully updated.' }
        format.json { render :show, status: :ok, location: @opciones_respuestum }
      else
        format.html { render :edit }
        format.json { render json: @opciones_respuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opciones_respuesta/1
  # DELETE /opciones_respuesta/1.json
  def destroy
    @opciones_respuestum.destroy
    respond_to do |format|
      format.html { redirect_to opciones_respuesta_url, notice: 'Opciones respuestum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opciones_respuestum
      @opciones_respuestum = OpcionesRespuestum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opciones_respuestum_params
      params.require(:opciones_respuestum).permit(:nombre, :valor)
    end
end
