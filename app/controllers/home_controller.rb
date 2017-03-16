class HomeController < ApplicationController
  before_action :authenticate_user!

  def index

    if !current_user.aprobado
      redirect_to "/users/edit"
    end
    if current_user.esvoluntario
      sexo_id = current_user.tipo_de_sexos_id
      @sexo = TipoDeSexo.find(sexo_id)
    end

    @volprueba = VoluntarioPrueba.where(users_id: sexo_id)
  end

  def aprobacion
    @user = User.find params["id"]
    @user.update(aprobacion_params)
    redirect_to :back
  end




  def edit
    hola = "hola"
    usuario = User.find current_user.id
    usuario.update(detalleubicacion_params)
    redirect_to "/users/edit"
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



  def detalleubicacion_params
    params.require(:user).permit(:certestudios,
    :docidentidad,
    :tarjetaprofesional,
    :camaracomercio,
    :rut,
    :certexperiencia)
  end

  private
  def aprobacion_params
    params.require(:user).permit( :aprobado)
  end
end
