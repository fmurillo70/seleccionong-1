class VerificacionusersController < ApplicationController

  def index
    unless current_user.esadmin
      redirect_to root_path
    end

    @usuarios = User.all

    @usuariosverificar = User.where('(aprobado=false OR aprobado is null) and esvoluntario = true')
    @usuariosactivos = User.where(aprobado: true, esvoluntario: true)


    @ongverificar = User.where('(aprobado=false OR aprobado is null) and esong = true')
    @ongactivos = User.where(aprobado: true, esong: true)

  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end


  def departamentos
    @departamentos = Departamento.all
  end

  def municipios

    @municipios = Municipio.where(departamento_id: params[:id])
  end

  def voluntariocreate
    nombres = params[:nombres]
    apellidos = params[:apellidos]
    tipo_documentos_id = params[:tipo_documentos_id]
    numdoc = params[:numdoc]
    tipo_de_sexos_id = params[:tipo_de_sexos_id]
    paises_id = params[:paises_id]
    ubicacionviviendas_id = params[:ubicacionviviendas_id]
    direccion = params[:direccion]
    tenenciaviviendas_id = params[:tenenciaviviendas_id]
    tipocontactos_id = params[:tipocontactos_id]
    numerocontacto = params[:numerocontacto]
    religions_id = params[:religions_id]
    tipo_estado_civils_id = params[:tipo_estado_civils_id]

    municipio_id = params[:ciudad]
    departamento_id = params[:departamento]

    actualmenteestudia = params[:actualmenteestudia]
    programaestudio = params[:programaestudio]
    ultimotitulo = params[:ultimotitulo]
    tipoestudio_id = params[:tipoestudio_id]
    jornadaestudio_id = params[:jornadaestudio_id]
    actualmentetrabaja = params[:actualmentetrabaja]
    tipo_eps = params[:tipo_eps]
    estrato = params[:estrato]
    nombrepersona = params[:nombrepersona]
    telpersona = params[:telpersona]
    relacionpersona = params[:relacionpersona]


    fechanacimiento = DateTime.civil(Integer(params[:yearbirth]), Integer(params[:monthbirth]), Integer(params[:daybirth]))

    edad = age(fechanacimiento)


    x = Nivelacademico.new(
        actualmenteestudia: actualmenteestudia,
        programaestudio: programaestudio,
        ultimotitulo: ultimotitulo,
        tipoestudio_id: tipoestudio_id,
        jornadaestudio_id: jornadaestudio_id
    )


    x.save
    nivelacademicos_id = x.id


    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    @user = User.new(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        esvoluntario: true,
        actualmentetrabaja: actualmentetrabaja,
        tipo_eps: tipo_eps,
        estrato: estrato,
        nombrepersona: nombrepersona,
        telpersona: telpersona,
        relacionpersona: relacionpersona

    )


    if @user.save

      @voluntario = Voluntario.create!(
          nombres: nombres,
          apellidos: apellidos,
          tipo_documentos_id: tipo_documentos_id,
          numdoc: numdoc,
          paises_id: paises_id,
          direccion: direccion,
          tenenciaviviendas_id: tenenciaviviendas_id,
          tipocontactos_id: tipocontactos_id,
          numerocontacto: numerocontacto,
          religions_id: religions_id,
          tipo_estado_civils_id: tipo_estado_civils_id,
          tipo_de_sexos_id: tipo_de_sexos_id,
          ubicacionviviendas_id: ubicacionviviendas_id,
          fechanacimiento: fechanacimiento,
          edad: edad,
          user_id: @user.id,
          nivelacademicos_id: nivelacademicos_id,
          municipio_id: municipio_id,
          departamento_id: departamento_id,

      )
      redirect_to root_path
    else
      redirect_to root_path
      #format.json { render json: @user.errors, status: :unprocessable_entity }
    end


  end


  def newadmin

  end

  def createadmin
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    nombre = params[:nombre]
    apellido = params[:apellido]
    cedula = params[:cedula]

    cargo = params[:cargo]

    User.create!(
            email: email,
            password: password,
            password_confirmation: password_confirmation,
            nombreadmin: nombre,
            apellidoadmin: apellido,
            cedulaadmin: cedula,
            cargoadmin: cargo,
            esadmin: true,
            aprobado: true

    )

    redirect_to "/verificacionusers/index"

  end

  def editadmin
    @user = User.find(params[:id])
  end

  def updateadmin
    id = params[:id]
    puts id
    email = params[:email]
    nombre = params[:nombre]
    apellido = params[:apellido]
    cedula = params[:cedula]
    cargo = params[:cargo]

    #password = params[:password]
    #password_confirmation = params[:password_confirmation]
    #password: password,
    #    password_confirmation: password_confirmation,

    usuario = User.find(id)

    usuario.update!(
        email: email,
        nombreadmin: nombre,
        apellidoadmin: apellido,
        cedulaadmin: cedula,
        cargoadmin: cargo,

    )

    redirect_to "/verificacionusers/index"
  end


  def admindestroy
    id = params[:id]

    @user = User.find(id)

    if @user.esong
      @user.ong.destroy
    end

    if @user.esvoluntario
      @user.voluntario.destroy
    end

    @user.destroy
    respond_to do |format|
      format.html { redirect_to "/verificacionusers/index", notice: 'El usuario ha sido eliminado.' }

    end
  end


  def ongcreate

    nombre = params[:nombre]
    nit = params[:nit]
    direccion = params[:direccion]
    telefono = params[:telefono]
    nombre_representante = params[:nombre_representante]
    apellido_representante = params[:apellido_representante]
    doc_representante = params[:doc_representante]
    mision = params[:mision]
    vision = params[:vision]

    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    # constitucion

    constitucion = DateTime.civil(Integer(params[:yearbirth]), Integer(params[:monthbirth]), Integer(params[:daybirth]))

    @user = User.new(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        esong: true
    )


      if @user.save
        @ong = Ong.create(
            nombre: nombre,
            nit: nit,
            direccion: direccion,
            telefono: telefono,
            nombre_representante: nombre_representante,
            apellido_representante: apellido_representante,
            doc_representante: doc_representante,
            mision: mision,
            vision: vision,
            constitucion: constitucion,
            user_id: @user.id
        )
        redirect_to root_path
      else
        redirect_to :back
      end





    # params[:user][:fechanacimiento] = date
    # if params[:user][:esong] == "true"
    #   params[:user][:esong] = true
    # end
    # params[:user][:aprobado] = false
    #
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to root_path
    # else
    #   format.json { render json: @user.errors, status: :unprocessable_entity }
    # end
  end


  def emailcheck
    @user = User.search(params[:email])
    #@user = User.where(email: params[:email])
    #existe = @user.length == 1 ? "existe" : nil
    respond_to do |format|
      format.json {render :json => {email_exists: @user.present?}} #sir Deep suggestion to return true or false for email_exists or the code below
      #format.json {render :json => @us} #this will output null if email is not in the database
    end
  end

  def ong

  end

  private
  def user_params
    params.require(:user).permit(:nombres, :numdoc, :direccion, :numerocontacto, :email, :nombresrepresentante, :apellidosrepresentante, :numdocrepresentante, :mision, :vision, :esong, :password, :password_confirmation, :fechanacimiento, :esong, :aprobado)
  end
end
