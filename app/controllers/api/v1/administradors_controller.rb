module Api::V1
  class AdministradorsController < ApplicationController
    def index 
      cros_headers
      #Todos os dados do banco da migration
      render json: Administrador.all
    end

    def create 
      cros_headers
      administrador = Administrador.new(administrador_params)
    
      if administrador.save() #caso de tudo certo
        render json: administrador, status: 200
      else #caso aconteça algum erro 
        render json: { errors: administrador.errors.exception }, status: 400
      end
    end

    def update 
      cros_headers
      administrador = Administrador.find(params[:id])

      if administrador.update(administrador_params) #caso de tudo certo
        render json: administrador, status: 202
      else #caso aconteça algum erro
        render json: { errors: administrador.errors.full_messages }, status: 400
      end
    end

    def destroy 
      cros_headers
      administrador = Administrador.find(params[:id])

      if administrador.destroy #caso de tudo certo
        render json: administrador, status: 202
      else #caso aconteça algum erro
        render json: { errors: administrador.errors.full_messages }, status: 400
      end
    end

    private 

    def cros_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, HEAD, DELETE'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
    end
    
    def administrador_params 
      #Essa função limita os paramentros que serão aceitos pela api
      params.require(:administrador).permit(:nome, :email, :telefone, :senha)
    end
    
  end
end