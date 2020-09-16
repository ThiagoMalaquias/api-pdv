class ApplicationController < ActionController::API
  before_action :valida_token_api, :cross_domain, :except => [:options]

  def valida_token_api
    if params[:controller] == "api/v1/funcionarios"
      token = request.headers["Authentic-Token"]

      if Token.where(nome: token).count == 0
        render json: {message: 'Token invalido ou vazio'}, status: 401
      end
    else
      token = request.headers["Authentic-Token"]
      tokenUser = Base64.decode64(request.headers["Token-User"])
      
      if Token.where(nome: token).count == 0 && Funcionario.where(token: tokenUser).count == 0
        render json: {message: 'Token invalido ou vazio'}, status: 401
      end
    end
  end

  def options
    cross_domain
    render json: {}, status: 200
  end

  private

  def cross_domain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, HEAD, DELETE, PUT'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authentic-Token, Token-User'
  end

end
