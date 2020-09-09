module Api
  module V1
    class AdministradorsController < ApplicationController
      def index
        #Todos os dados do banco da migration
        render json: Administrador.all
      end

      def create 
        administrador = Administrador.new(administrador_params)
      
        if administrador.save() #caso de tudo certo
          render json: administrador, status: 200
        else #caso aconteça algum erro
          render json: { errors: administrador.errors.full_messages }, status: 400
        end
      end

      def update 
        administrador = Administrador.find(params[:id])

        if administrador.update(administrador_params) #caso de tudo certo
          render json: administrador, status: 202
        else #caso aconteça algum erro
          render json: { errors: administrador.errors.full_messages }, status: 400
        end
      end

      def destroy 
        administrador = Administrador.find(params[:id])

        if administrador.destroy #caso de tudo certo
          render json: administrador, status: 202
        else #caso aconteça algum erro
          render json: { errors: administrador.errors.full_messages }, status: 400
        end
      end

      private 
      
      def administrador_params 
        #Essa função limita os paramentros que serão aceitos pela api
        params.require(:administrador).permit(:nome, :email, :telefone, :senha)
      end
      
    end
  end
end