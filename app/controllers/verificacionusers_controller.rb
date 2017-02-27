class VerificacionusersController < ApplicationController
  def index
    @usuarios = User.all

  end
end
