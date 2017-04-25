class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
        [:esadmin,
         :tipouser_id,
         :municipio_id,
         :esvoluntario,
         :esong,
        :aprobado])
    devise_parameter_sanitizer.permit(:account_update, keys: [
        :esadmin,
        :tipouser_id,
        :municipio_id,
        :esvoluntario,
        :esong,
        :aprobado

        ])
  end
end
