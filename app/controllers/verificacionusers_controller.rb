class VerificacionusersController < ApplicationController
  def index
    unless current_user.esadmin
      redirect_to root_path
    end
    @usuariosverificar = User.where('(aprobado=false OR aprobado is null) and esvoluntario = true')
    @usuariosactivos = User.where(aprobado: true, esvoluntario: true)


    @ongverificar =      User.where('(aprobado=false OR aprobado is null) and esong = true')
    @ongactivos = User.where(aprobado: true, esong: true)

  end



  def ong

  end
end
