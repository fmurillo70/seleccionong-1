class PruebasCompetenciaController < ApplicationController
  before_action :set_pruebas_competencium, only: [:show, :edit, :update, :destroy]

  # GET /pruebas_competencia
  # GET /pruebas_competencia.json
  def index
    @pruebas_competencia = PruebasCompetencia.all
  end

  # GET /pruebas_competencia/1
  # GET /pruebas_competencia/1.json
  def show
  end

  # GET /pruebas_competencia/new
  def new
    #@pruebas_competencium = PruebasCompetencia.new
    @apitudes = Aptitude.all
  end

  # GET /pruebas_competencia/1/edit
  def edit
  end

  # POST /pruebas_competencia
  # POST /pruebas_competencia.json
  def create
    @variable = pruebas_competencium_params
    nombre = params[:nombrePrueba]
    preguntas = params[:preguntas]
    competencia = params[:competencia]

    x = PruebasCompetencia.new(nombre:nombre,aptitudes_id: competencia)
    x.save
    preguntas.each do |p|

     d = Pregunta.new(nombre: p[:nombre], pruebas_competencia_id: x[:id] )
     d.save
     p[:respuestas].each_with_index do |r,index|
       valor = index + 1
       z = OpcionesRespuestum.new(nombre: r[:nombre], valor: valor, pregunta_id: d[:id] )
       z.save
     end
    end
    render :json => {'ok': "Ok"}


    #@pruebas_competencium = PruebasCompetencia.new(pruebas_competencium_params)

    #respond_to do |format|
    #  if @pruebas_competencium.save
    #    format.html { redirect_to @pruebas_competencium, notice: 'Pruebas competencium was successfully created.' }

    #  else
    #    format.html { render :new }
    #    format.json { render json: @pruebas_competencium.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /pruebas_competencia/1
  # PATCH/PUT /pruebas_competencia/1.json
  def update
    respond_to do |format|
      if @pruebas_competencium.update(pruebas_competencium_params)
        format.html { redirect_to @pruebas_competencium, notice: 'Pruebas competencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @pruebas_competencium }
      else
        format.html { render :edit }
        format.json { render json: @pruebas_competencium.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /pruebas_competencia/1
  # DELETE /pruebas_competencia/1.json
  def destroy
    @pruebas_competencium.destroy
    respond_to do |format|
      format.html { redirect_to pruebas_competencia_url, notice: 'Pruebas competencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pruebas_competencium
      @pruebas_competencium = PruebasCompetencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pruebas_competencium_params
      params.require(:pruebas_competencium).permit(:nombre)
    end
end
