class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     @paises = Paise.all
     @tipodocumentos = TipoDocumento.all
     @sexos = TipoDeSexo.all
     @ubicacionvivienda = Ubicacionvivienda.all
     @tenenciavivienda = Tenenciavivienda.all
     @tipocontacto = Tipocontacto.all
     @religion = Religion.all
     @estadocivil = TipoEstadoCivil.all
     @tipoestudio = Tipoestudio.all
     @jornadaestudio = Jornadaestudio.all

     super

   end


   def age(dob)
     now = Time.now.utc.to_date
     now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
   end
  # POST /resource
   def create
     date = DateTime.civil( Integer(params[:yearbirth]), Integer(params[:monthbirth]), Integer( params[:daybirth]))
     edad = age(date)

     x = Nivelacademico.new(
         actualmenteestudia: params[:actualmenteestudia],
         programaestudio:params[:programaestudio],
         ultimotitulo:params[:ultimotitulo],
         tipoestudio_id:params[:tipoestudio_id],
         jornadaestudio_id:params[:jornadaestudio_id]
     )
     x.save



     params[:user][:nivelacademicos_id] = x[:id]
     params[:user][:edad] = edad
     params[:user][:fechanacimiento] = date
     if params[:user][:esvoluntario] == "true"
       params[:user][:esvoluntario] = true
     end
     params[:user][:aprobado] = false
     params[:user][:tipo_documento] = TipoDocumento.find(Integer(params[:user][:tipo_documentos_id], 10))
     params[:tipo_documento] = TipoDocumento.find(Integer(params[:user][:tipo_documentos_id], 10))

     super
   end


   def edit
     super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
