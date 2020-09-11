class ApplicationController < ActionController::API
  before_action :valida_token_api

  def valida_token_api
    tokenValido = "7c76a78f-7123-40b1-84fd-2be5cea4131d"
    tokenBase64 = "N2M3NmE3OGYtNzEyMy00MGIxLTg0ZmQtMmJlNWNlYTQxMzFk"

    token = request.headers["Authentic-Token"]

    if token.present?
      token = Base64.decode64(token)    
    end

    if token != tokenValido
      render json: {message: 'Token invalido ou vazio'}, status: 401
    end
  end

end
