class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    sexo_id = current_user.tipo_de_sexos_id
    @sexo = TipoDeSexo.find(sexo_id)
    @volprueba = VoluntarioPrueba.where(users_id: sexo_id)
  end


  def conpruebas
    @pruebas = PruebasCompetencia.all
  end

  def conpruebasid
    id =  params[:id]
    @prueba = PruebasCompetencia.find(id)
    @preguntas = Pregunta.where(pruebas_competencia_id: id)
  end




end
