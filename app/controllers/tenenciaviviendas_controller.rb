class TenenciaviviendasController < ApplicationController
  before_action :set_tenenciavivienda, only: [:show, :edit, :update, :destroy]

  # GET /tenenciaviviendas
  # GET /tenenciaviviendas.json
  def index
    @tenenciaviviendas = Tenenciavivienda.all
  end

  # GET /tenenciaviviendas/1
  # GET /tenenciaviviendas/1.json
  def show
  end

  # GET /tenenciaviviendas/new
  def new
    @tenenciavivienda = Tenenciavivienda.new
  end

  # GET /tenenciaviviendas/1/edit
  def edit
  end

  # POST /tenenciaviviendas
  # POST /tenenciaviviendas.json
  def create
    @tenenciavivienda = Tenenciavivienda.new(tenenciavivienda_params)

    respond_to do |format|
      if @tenenciavivienda.save
        format.html { redirect_to @tenenciavivienda, notice: 'Tenenciavivienda was successfully created.' }
        format.json { render :show, status: :created, location: @tenenciavivienda }
      else
        format.html { render :new }
        format.json { render json: @tenenciavivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenenciaviviendas/1
  # PATCH/PUT /tenenciaviviendas/1.json
  def update
    respond_to do |format|
      if @tenenciavivienda.update(tenenciavivienda_params)
        format.html { redirect_to @tenenciavivienda, notice: 'Tenenciavivienda was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenenciavivienda }
      else
        format.html { render :edit }
        format.json { render json: @tenenciavivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenenciaviviendas/1
  # DELETE /tenenciaviviendas/1.json
  def destroy
    @tenenciavivienda.destroy
    respond_to do |format|
      format.html { redirect_to tenenciaviviendas_url, notice: 'Tenenciavivienda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenenciavivienda
      @tenenciavivienda = Tenenciavivienda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenenciavivienda_params
      params.require(:tenenciavivienda).permit(:nombre)
    end
end
