class ApplicationController < ActionController::API
  before_action :valida_token_api, :cross_domain, :except => [:options]

  def valida_token_api
    token = request.headers["Authentic-Token"]
    
    if Administrador.where(token: token).count == 0
      render json: {message: 'Token invalido ou vazio'}, status: 401
    end
  end

  def options
    cross_domain
    render json: {}, status: 200
  end

  private

  def cross_domain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, HEAD, DELETE'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authentic-Token'
  end

end
