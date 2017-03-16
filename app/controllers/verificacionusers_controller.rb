class VerificacionusersController < ApplicationController
  def index
    unless current_user.esadmin
      redirect_to root_path
    end
    @usuariosverificar = User.where('(aprobado=false OR aprobado is null) and esvoluntario = true')
    @usuariosactivos = User.where(aprobado: true, esvoluntario: true)


    @ongverificar = User.where('(aprobado=false OR aprobado is null) and esong = true')
    @ongactivos = User.where(aprobado: true, esong: true)

  end

  def ongcreate
    date = DateTime.civil( Integer(params[:yearbirth]), Integer(params[:monthbirth]), Integer( params[:daybirth]))

    params[:user][:fechanacimiento] = date
    if params[:user][:esong] == "true"
      params[:user][:esong] = true
    end
    params[:user][:aprobado] = false

    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end


  def ong

  end

  private
  def user_params
    params.require(:user).permit(:nombres, :numdoc, :direccion, :numerocontacto, :email, :nombresrepresentante, :apellidosrepresentante, :numdocrepresentante, :mision, :vision, :esong, :password, :password_confirmation,:fechanacimiento,    :esong,    :aprobado)
  end
end
