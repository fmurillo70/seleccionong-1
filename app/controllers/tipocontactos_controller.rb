class TipocontactosController < ApplicationController
  before_action :set_tipocontacto, only: [:show, :edit, :update, :destroy]

  # GET /tipocontactos
  # GET /tipocontactos.json
  def index
    @tipocontactos = Tipocontacto.all
  end

  # GET /tipocontactos/1
  # GET /tipocontactos/1.json
  def show
  end

  # GET /tipocontactos/new
  def new
    @tipocontacto = Tipocontacto.new
  end

  # GET /tipocontactos/1/edit
  def edit
  end

  # POST /tipocontactos
  # POST /tipocontactos.json
  def create
    @tipocontacto = Tipocontacto.new(tipocontacto_params)

    respond_to do |format|
      if @tipocontacto.save
        format.html { redirect_to @tipocontacto, notice: 'Tipocontacto was successfully created.' }
        format.json { render :show, status: :created, location: @tipocontacto }
      else
        format.html { render :new }
        format.json { render json: @tipocontacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipocontactos/1
  # PATCH/PUT /tipocontactos/1.json
  def update
    respond_to do |format|
      if @tipocontacto.update(tipocontacto_params)
        format.html { redirect_to @tipocontacto, notice: 'Tipocontacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipocontacto }
      else
        format.html { render :edit }
        format.json { render json: @tipocontacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipocontactos/1
  # DELETE /tipocontactos/1.json
  def destroy
    @tipocontacto.destroy
    respond_to do |format|
      format.html { redirect_to tipocontactos_url, notice: 'Tipocontacto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipocontacto
      @tipocontacto = Tipocontacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipocontacto_params
      params.require(:tipocontacto).permit(:nombre)
    end
end
