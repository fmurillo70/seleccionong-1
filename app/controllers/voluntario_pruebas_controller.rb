class VoluntarioPruebasController < ApplicationController
  before_action :set_voluntario_prueba, only: [:show, :edit, :update, :destroy]

  # GET /voluntario_pruebas
  # GET /voluntario_pruebas.json
  def index
    @voluntario_pruebas = VoluntarioPrueba.all
  end

  # GET /voluntario_pruebas/1
  # GET /voluntario_pruebas/1.json
  def show
  end

  # GET /voluntario_pruebas/new
  def new
    @voluntario_prueba = VoluntarioPrueba.new
  end

  # GET /voluntario_pruebas/1/edit
  def edit
  end

  # POST /voluntario_pruebas
  # POST /voluntario_pruebas.json
  def create
    @voluntario_prueba = VoluntarioPrueba.new(voluntario_prueba_params)

    respond_to do |format|
      if @voluntario_prueba.save
        format.html { redirect_to @voluntario_prueba, notice: 'Voluntario prueba was successfully created.' }
        format.json { render :show, status: :created, location: @voluntario_prueba }
      else
        format.html { render :new }
        format.json { render json: @voluntario_prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voluntario_pruebas/1
  # PATCH/PUT /voluntario_pruebas/1.json
  def update
    respond_to do |format|
      if @voluntario_prueba.update(voluntario_prueba_params)
        format.html { redirect_to @voluntario_prueba, notice: 'Voluntario prueba was successfully updated.' }
        format.json { render :show, status: :ok, location: @voluntario_prueba }
      else
        format.html { render :edit }
        format.json { render json: @voluntario_prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntario_pruebas/1
  # DELETE /voluntario_pruebas/1.json
  def destroy
    @voluntario_prueba.destroy
    respond_to do |format|
      format.html { redirect_to voluntario_pruebas_url, notice: 'Voluntario prueba was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voluntario_prueba
      @voluntario_prueba = VoluntarioPrueba.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voluntario_prueba_params
      params.fetch(:voluntario_prueba, {})
    end
end
