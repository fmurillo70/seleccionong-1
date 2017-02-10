class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:nombres ,   :apellidos,    :tipodoc,    :numdoc,    :fechanacimiento,    :edad,    :sexo,    :nacionalidad,    :estadocivil,    :direccion,    :ubicacionvivienda,    :tenenciavivienda,    :numerocontacto,    :tipocontacto,    :religion,    :nivelacademico,    :ultimotitulo,    :actualestudiante,    :programaestudio,    :tipoestudio,    :jornadaestudio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombres])
  end
end
