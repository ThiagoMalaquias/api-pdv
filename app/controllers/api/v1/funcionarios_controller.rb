module Api
  module V1
    class FuncionariosController < ApplicationController
      def index
        cros_headers
        render json: Funcionario.all
      end

      def create
        cros_headers
        funcionario = Funcionario.new(funcionario_params)

        if funcionario.save()
          render json: funcionario, status: 200
        else
          render json: { errors: funcionario.errors.full_messages}, status: 400
        end
      end

      def update
        cros_headers
        funcionario = Funcionario.find(params[:id])

        if funcionario.update(funcionario_params)
          render json: funcionario, status: 200
        else
          render json: { errors: funcionario.errors.full_messages}, status: 400
        end
      end

      def destroy
        cros_headers
        funcionario = Funcionario.find(params[:id])

        if funcionario.destroy
          render json: funcionario, status: 200
        else
          render json: { errors: funcionario.errors.full_messages}, status: 400
        end
      end

      private

      def cros_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, HEAD, DELETE'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
      end

      def funcionario_params
        params.require(:funcionario).permit(:nome, :email, :telefone, :cpf, :endereco, :turno, :data_contratacao, :sexo)
      end
      
    end
  end
end