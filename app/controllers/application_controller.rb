class ApplicationController < ActionController::API
  before_action :valida_token_api

  def valida_token_api
    token = request.headers["Authentic-Token"]

    if Administrador.where(token: "9d973ec6-4831-4893-bce8-bb1478dd6cfc").count == 0
      render json: {message: 'Token invalido ou vazio'}, status: 401
    end
  end

end
