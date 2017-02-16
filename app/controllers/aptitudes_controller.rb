class AptitudesController < ApplicationController
  before_action :set_aptitude, only: [:show, :edit, :update, :destroy]

  # GET /aptitudes
  # GET /aptitudes.json
  def index
    @aptitudes = Aptitude.all
  end

  # GET /aptitudes/1
  # GET /aptitudes/1.json
  def show
  end

  # GET /aptitudes/new
  def new
    @aptitude = Aptitude.new
  end

  # GET /aptitudes/1/edit
  def edit
  end

  # POST /aptitudes
  # POST /aptitudes.json
  def create
    @aptitude = Aptitude.new(aptitude_params)

    respond_to do |format|
      if @aptitude.save
        format.html { redirect_to @aptitude, notice: 'Aptitude was successfully created.' }
        format.json { render :show, status: :created, location: @aptitude }
      else
        format.html { render :new }
        format.json { render json: @aptitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aptitudes/1
  # PATCH/PUT /aptitudes/1.json
  def update
    respond_to do |format|
      if @aptitude.update(aptitude_params)
        format.html { redirect_to @aptitude, notice: 'Aptitude was successfully updated.' }
        format.json { render :show, status: :ok, location: @aptitude }
      else
        format.html { render :edit }
        format.json { render json: @aptitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aptitudes/1
  # DELETE /aptitudes/1.json
  def destroy
    @aptitude.destroy
    respond_to do |format|
      format.html { redirect_to aptitudes_url, notice: 'Aptitude was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aptitude
      @aptitude = Aptitude.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aptitude_params
      params.require(:aptitude).permit(:nombre)
    end
end
