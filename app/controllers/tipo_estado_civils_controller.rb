class TipoEstadoCivilsController < ApplicationController
  before_action :set_tipo_estado_civil, only: [:show, :edit, :update, :destroy]

  # GET /tipo_estado_civils
  # GET /tipo_estado_civils.json
  def index
    @tipo_estado_civils = TipoEstadoCivil.all
  end

  # GET /tipo_estado_civils/1
  # GET /tipo_estado_civils/1.json
  def show
  end

  # GET /tipo_estado_civils/new
  def new
    @tipo_estado_civil = TipoEstadoCivil.new
  end

  # GET /tipo_estado_civils/1/edit
  def edit
  end

  # POST /tipo_estado_civils
  # POST /tipo_estado_civils.json
  def create
    @tipo_estado_civil = TipoEstadoCivil.new(tipo_estado_civil_params)

    respond_to do |format|
      if @tipo_estado_civil.save
        format.html { redirect_to @tipo_estado_civil, notice: 'Tipo estado civil was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_estado_civil }
      else
        format.html { render :new }
        format.json { render json: @tipo_estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_estado_civils/1
  # PATCH/PUT /tipo_estado_civils/1.json
  def update
    respond_to do |format|
      if @tipo_estado_civil.update(tipo_estado_civil_params)
        format.html { redirect_to @tipo_estado_civil, notice: 'Tipo estado civil was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_estado_civil }
      else
        format.html { render :edit }
        format.json { render json: @tipo_estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_estado_civils/1
  # DELETE /tipo_estado_civils/1.json
  def destroy
    @tipo_estado_civil.destroy
    respond_to do |format|
      format.html { redirect_to tipo_estado_civils_url, notice: 'Tipo estado civil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_estado_civil
      @tipo_estado_civil = TipoEstadoCivil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_estado_civil_params
      params.require(:tipo_estado_civil).permit(:nombre)
    end
end
