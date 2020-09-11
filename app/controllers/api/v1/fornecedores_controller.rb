module Api
  module V1
    class FornecedoresController < ApplicationController
      def index
        cros_headers
        render json: Fornecedor.all
      end

      def create
        cros_headers
        fornecedor = Fornecedor.new(fornecedor_params)

        if fornecedor.save()
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      def update
        cros_headers
        fornecedor = Fornecedor.find(params[:id])

        if fornecedor.update(fornecedor_params)
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      def destroy
        cros_headers
        fornecedor = Fornecedor.find(params[:id])

        if fornecedor.destroy
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      private

      def cros_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, HEAD, DELETE'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
      end

      def fornecedor_params
        params.require(:fornecedor).permit(:nome, :email, :telefone, :cpf, :endereco, :sexo)
      end
      
    end
  end
end