class UbicacionviviendasController < ApplicationController
  before_action :set_ubicacionvivienda, only: [:show, :edit, :update, :destroy]

  # GET /ubicacionviviendas
  # GET /ubicacionviviendas.json
  def index
    @ubicacionviviendas = Ubicacionvivienda.all
  end

  # GET /ubicacionviviendas/1
  # GET /ubicacionviviendas/1.json
  def show
  end

  # GET /ubicacionviviendas/new
  def new
    @ubicacionvivienda = Ubicacionvivienda.new
  end

  # GET /ubicacionviviendas/1/edit
  def edit
  end

  # POST /ubicacionviviendas
  # POST /ubicacionviviendas.json
  def create
    @ubicacionvivienda = Ubicacionvivienda.new(ubicacionvivienda_params)

    respond_to do |format|
      if @ubicacionvivienda.save
        format.html { redirect_to @ubicacionvivienda, notice: 'Ubicacionvivienda was successfully created.' }
        format.json { render :show, status: :created, location: @ubicacionvivienda }
      else
        format.html { render :new }
        format.json { render json: @ubicacionvivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicacionviviendas/1
  # PATCH/PUT /ubicacionviviendas/1.json
  def update
    respond_to do |format|
      if @ubicacionvivienda.update(ubicacionvivienda_params)
        format.html { redirect_to @ubicacionvivienda, notice: 'Ubicacionvivienda was successfully updated.' }
        format.json { render :show, status: :ok, location: @ubicacionvivienda }
      else
        format.html { render :edit }
        format.json { render json: @ubicacionvivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicacionviviendas/1
  # DELETE /ubicacionviviendas/1.json
  def destroy
    @ubicacionvivienda.destroy
    respond_to do |format|
      format.html { redirect_to ubicacionviviendas_url, notice: 'Ubicacionvivienda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacionvivienda
      @ubicacionvivienda = Ubicacionvivienda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacionvivienda_params
      params.require(:ubicacionvivienda).permit(:nombre)
    end
end
