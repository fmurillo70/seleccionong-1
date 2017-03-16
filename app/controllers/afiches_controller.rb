class AfichesController < ApplicationController
  before_action :set_afich, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /afiches
  # GET /afiches.json
  def index
    if !current_user.aprobado
      redirect_to "/users/edit"
    end
    if !current_user.esong
      redirect_to :back
    end
    @afiches = Afich.all
  end

  # GET /afiches/1
  # GET /afiches/1.json
  def show
  end

  # GET /afiches/new
  def new
    @afich = Afich.new
  end

  # GET /afiches/1/edit
  def edit
  end

  # POST /afiches
  # POST /afiches.json
  def create
    @afich = Afich.new(afich_params)

    respond_to do |format|
      if @afich.save
        format.html { redirect_to @afich, notice: 'Afich was successfully created.' }
        format.json { render :show, status: :created, location: @afich }
      else
        format.html { render :new }
        format.json { render json: @afich.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /afiches/1
  # PATCH/PUT /afiches/1.json
  def update
    respond_to do |format|
      if @afich.update(afich_params)
        format.html { redirect_to @afich, notice: 'Afich was successfully updated.' }
        format.json { render :show, status: :ok, location: @afich }
      else
        format.html { render :edit }
        format.json { render json: @afich.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /afiches/1
  # DELETE /afiches/1.json
  def destroy
    @afich.destroy
    respond_to do |format|
      format.html { redirect_to afiches_url, notice: 'Afich was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_afich
      @afich = Afich.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def afich_params
      params.require(:afich).permit(:nombreorg, :nombrepuesto, :objetivospuesto, :horario, :actividadasociada, :beneficiarios, :quesehace, :comosehace, :coordinador, :requisitos, :experiencia, :incentivos, :periocidadincentivos)
    end
end
