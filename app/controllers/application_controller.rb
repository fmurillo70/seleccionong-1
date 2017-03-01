class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
        [:nombres, :apellidos, :numdoc, :fechanacimiento, :edad, :sexo, :nacionalidad,
         :estadocivil, :direccion, :ubicacionvivienda, :tenenciavivienda, :numerocontacto,
         :tipocontacto, :religion, :nivelacademico, :ultimotitulo, :actualestudiante,
         :programaestudio, :tipoestudio, :jornadaestudio, :tipo_documento, :tipo_documentos,
         :daybirth, :monthbirth, :yearbirth, :tipo_de_sexos, :paises, :ubicacionviviendas,
         :tenenciaviviendas, :tipocontactos, :religions, :tipo_estado_civils,
         :paises_id, :tipo_de_sexos_id, :tipo_estado_civils_id, :tipo_documentos_id, :religions_id,
         :ubicacionviviendas_id, :tenenciaviviendas_id, :tipocontactos_id, :nivelacademicos_id,
         :certestudios,
         :certexperiencia,
         :docidentidad,
         :tarjetaprofesional,
         :camaracomercio,
         :rut,
         :mision,
         :vision,
         :nombresrepresentante,
         :apellidosrepresentante,
         :numdocrepresentante,
         :esvoluntario,
         :esong])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombres, :certestudios, :certexperiencia, :docidentidad, :tarjetaprofesional,:camaracomercio,
                                                              :certestudios_file_name,
                                                              :avatar,
    :rut])
  end
end
