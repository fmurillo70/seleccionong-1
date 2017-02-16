class TipoDeSexosController < ApplicationController
  before_action :set_tipo_de_sexo, only: [:show, :edit, :update, :destroy]

  # GET /tipo_de_sexos
  # GET /tipo_de_sexos.json
  def index
    @tipo_de_sexos = TipoDeSexo.all
  end

  # GET /tipo_de_sexos/1
  # GET /tipo_de_sexos/1.json
  def show
  end

  # GET /tipo_de_sexos/new
  def new
    @tipo_de_sexo = TipoDeSexo.new
  end

  # GET /tipo_de_sexos/1/edit
  def edit
  end

  # POST /tipo_de_sexos
  # POST /tipo_de_sexos.json
  def create
    @tipo_de_sexo = TipoDeSexo.new(tipo_de_sexo_params)

    respond_to do |format|
      if @tipo_de_sexo.save
        format.html { redirect_to @tipo_de_sexo, notice: 'Tipo de sexo was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_de_sexo }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_sexo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_de_sexos/1
  # PATCH/PUT /tipo_de_sexos/1.json
  def update
    respond_to do |format|
      if @tipo_de_sexo.update(tipo_de_sexo_params)
        format.html { redirect_to @tipo_de_sexo, notice: 'Tipo de sexo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_de_sexo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_sexo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_de_sexos/1
  # DELETE /tipo_de_sexos/1.json
  def destroy
    @tipo_de_sexo.destroy
    respond_to do |format|
      format.html { redirect_to tipo_de_sexos_url, notice: 'Tipo de sexo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_sexo
      @tipo_de_sexo = TipoDeSexo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_sexo_params
      params.require(:tipo_de_sexo).permit(:nombre)
    end
end
