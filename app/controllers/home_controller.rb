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
    id = params[:id]
    @prueba = PruebasCompetencia.find(id)
    @preguntas = Pregunta.where(pruebas_competencia_id: id)
  end

  def pruebasresp
    pruebaId = params[:pruebanum]
    prueba = PruebasCompetencia.find(pruebaId)
    preguntas = Pregunta.where(:pruebas_competencia_id => prueba.id)
    result = Resultado.new(pruebas_competencia_id: pruebaId, users_id: current_user.id )
    result.save
    preguntas.each do |p|
      opcion = OpcionesRespuestum.find(params["resp"+p.id.to_s])
      numopcion = OpcionesRespuestum.where(pregunta_id: p.id).count

      r = Respuesta.new(texto: opcion.nombre, puntaje: ((100 / numopcion) * opcion.valor).round, resultados_id: result.save )
      r.save
    end
    x = params

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Se ha guardado exitosamente su respuesta' }
    end
  end


end
