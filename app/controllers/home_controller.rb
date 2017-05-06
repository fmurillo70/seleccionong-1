class HomeController < ApplicationController
  before_action :authenticate_user!



  def exaprovol
    @voluntaros = User.where(aprobado: !true, esvoluntario: true)
  end

  def exaproong
    @ong = User.where(aprobado: !true, esong: true)
  end

  def exvoluntarios
    @appafiche = Aplicacionafiche.all
    @voluntarios = Voluntario.order('created_at DESC')
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="voluntarios.xlsx"'
      }
    end
  end

  def exong
    @ongs = Ong.order('created_at DESC')
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="ong.xlsx"'
      }
    end
  end

  def exingresos

    @users = User.order('id DESC')
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="ingresos.xlsx"'
      }
    end
  end


  def bloquear
    us = User.find(params[:id])
    us.update!(aprobado: !us.aprobado)
    redirect_to :back
  end
  def exevaluacion
    @pruebas = Resultado.all
    @voluntarios = Voluntario.order('created_at DESC')
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="voluntarios-pruebas.xlsx"'
      }
    end

  end

  def voluntario
    @user = User.find(params[:id])


    @pais = Paise.find(@user.voluntario.paises_id)
    @sexo = TipoDeSexo.find(@user.voluntario.tipo_de_sexos_id)
    @estadocivil = TipoEstadoCivil.find(@user.voluntario.tipo_estado_civils_id)
    @religion = Religion.find(@user.voluntario.religions_id)
    @ubicacionvivienda = Ubicacionvivienda.find(@user.voluntario.ubicacionviviendas_id)
    @tenenciavivienda = Tenenciavivienda.find(@user.voluntario.tenenciaviviendas_id)
    @tipocontacto = Tipocontacto.find(@user.voluntario.tipocontactos_id)
    @nivelacademico = Nivelacademico.find(@user.voluntario.nivelacademicos_id)
    @municipio = Municipio.find(@user.voluntario.municipio_id)
    @departamento = Departamento.find(@user.voluntario.departamento_id)
  end
  def ong
    @user = User.find(params[:id])
  end

  def index

    if !current_user.aprobado
      redirect_to "/users/edit"
    end
    if current_user.esvoluntario
      puts current_user.voluntario
      sexo_id = current_user.voluntario.tipo_de_sexos_id
      @sexo = TipoDeSexo.find(sexo_id)
    end

    @volprueba = VoluntarioPrueba.where(users_id: sexo_id)
  end

  def aprobacion
    @user = User.find params["id"]
    @user.update(aprobacion_params)

    RestClient.post "https://api:key-0d5bf1842487e19e86639097949b56dd"\
  "@api.mailgun.net/v3/experienciaganadora.com/messages",
                    :from => "soporte@uan.edu.co",
                    :to => @user.email,
                    :subject => "Has sido aprobado",
                    :text => "Felicitaciones. Has sido aprobado por el administrador ahora puedes iniciar sesion en el sistema",
                    "o:deliverytime" => "Fri, 25 Oct 2011 23:10:10 -0000"

    redirect_to :back
  end


  def edit

    usuario = User.find current_user.id

    if usuario.esong
      usuario.ong.update(detalleubicacion_params)
    elsif usuario.esvoluntario
      usuario.voluntario.update(detalleubicacion_params)
    end
    # usuario.update(detalleubicacion_params)
    redirect_to "/users/edit"
  end

  def conpruebas
    @resultados = Resultado.select("pruebas_competencia_id").where(user_id: current_user.id)

    if @resultados.length == 0
      @resultados = [0]
    else
      @resultados = @resultados.collect { |u| u.pruebas_competencia_id }
    end


    @pruebas = PruebasCompetencia.where("pruebas_competencia.id not IN (?)", @resultados)

  end


  def imprimir

    id = params[:id]
    @prueba = PruebasCompetencia.find(id)
    @preguntas = Pregunta.where(pruebas_competencia_id: id)

    respond_to do |format|
      format.docx do
        render docx: 'conpruebasid', filename: 'prueba.docx'
      end
    end
  end

  def conpruebasid
    id = params[:id]
    @prueba = PruebasCompetencia.find(id)
    @preguntas = Pregunta.where(pruebas_competencia_id: id)
  end

  def convocatorias
    @puntajes = Resultado.where(user_id: current_user.id)

    @valores = Hash.new(0)
    @puntajes.each do |p|
      idcompetencia = PruebasCompetencia.find p.pruebas_competencia_id
      competencia = Aptitude.find(idcompetencia.aptitudes_id)
      # @valores.push([
      #                  competencia.nombre,

      #              ])

      @valores[competencia.nombre] = Respuesta.where(resultado_id: p.id).sum(:puntaje) / Respuesta.where(resultado_id: p.id).count(:all)
    end
    @afiches = Afich.all


  end


  def aplicarconvocatoria
    a = params[:afiche]

    Aplicacionafiche.create(user_id: current_user.id, afich_id: a)

    af = Afich.find(params[:id])
    RestClient.post "https://api:key-0d5bf1842487e19e86639097949b56dd"\
  "@api.mailgun.net/v3/experienciaganadora.com/messages",
                    :from => "soporte@uan.edu.co",
                    :to => current_user.email,
                    :subject => "Ha aplicado a la convocatoria exitosamente",
                    :text => "Felicitaciones. Ha aplicado a la convocatoria exitosamente, sus datos estaran en revision por el organizador de la convocatoria",
                    "o:deliverytime" => "Fri, 25 Oct 2011 23:10:10 -0000"


    redirect_to :back
  end

  def pruebasresp
    pruebaId = params[:pruebanum]
    prueba = PruebasCompetencia.find(pruebaId)
    preguntas = Pregunta.where(:pruebas_competencia_id => prueba.id)
    result = Resultado.new(pruebas_competencia_id: pruebaId, user_id: current_user.id)
    result.save
    preguntas.each do |p|
      opcion = OpcionesRespuestum.find(params["resp"+p.id.to_s])
      numopcion = OpcionesRespuestum.where(pregunta_id: p.id).count

      r = Respuesta.new(texto: opcion.nombre,
                        puntaje: ((100 / numopcion) * opcion.valor).round,
                        resultado_id: result.id)
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
                                 :certexperiencia,
                                 :documentoidentidad)
  end

  private
  def aprobacion_params
    params.require(:user).permit(:aprobado, :observacion)
  end
end
